let fs = require('fs');

on('rcore_clothing:getClothingFiles', () => {
    let numResources = GetNumResources()

    let clothingFiles = [];

    for (let i = 0; i < numResources; i++) {
        let res = GetResourceByFindIndex(i);
        let state = GetResourceState(res);

        if(state == 'started') {
            let path = GetResourcePath(res);

            let streamFolder = `${path}/stream`;

            if (!fs.existsSync(streamFolder)) {
                continue;
            }

            let files = recursiveFindFiles(streamFolder);

            for (let file of files) {
                let clothExtCorrect = file.endsWith('.ydd') || file.endsWith('.ytd');
                let clothStartCorrect = file.startsWith('mp_m_freemode_01') || file.startsWith('mp_f_freemode_01');

                if (clothExtCorrect && clothStartCorrect) {
                    clothingFiles.push(file);
                }
            }
        }
    }

    emit('rcore_clothing:computedClothingFiles', clothingFiles);
});

on('rcore_clothing:getHeads', (cb) => {
    
    let numResources = GetNumResources()

    let outPaths = [];

    for (let i = 0; i < numResources; i++) {
        let res = GetResourceByFindIndex(i);
        let state = GetResourceState(res);

        if(state == 'started') {
            let path = GetResourcePath(res);

            let streamFolder = `${path}/stream`;

            if (!fs.existsSync(streamFolder)) {
                continue;
            }

            let files = recursiveFindFiles(streamFolder, true);


            for(let fileData of files) {
                const [file, filePath] = fileData;
                const relativePath = filePath.replace(streamFolder, '');

                let isFemaleHead = file == 'mp_f_freemode_01^head_045_r.ydd';
                let isMaleHead = file == 'mp_m_freemode_01^head_045_r.ydd';
                let isClothingForPhotos = filePath.includes('rcore_clothing_for_photos')

                if(!isClothingForPhotos && (isFemaleHead || isMaleHead)) {
                    outPaths.push(filePath.replace('//', '/'));
                }
            }
        }
    }

    cb(outPaths);
})

function recursiveFindFiles(path, returnFullPath) {
    let items = fs.readdirSync(path);

    let files = [];

    for (let file of items) {
        let filePath = `${path}/${file}`;

        if (fs.lstatSync(filePath).isDirectory()) {
            let innerFiles = recursiveFindFiles(filePath, returnFullPath);

            files = files.concat(innerFiles);
        } else {
            if(returnFullPath) {
                files.push([file, filePath]);
            } else {
                files.push(file);
            }
        }
    }

    return files;
}

function loadClothingRelatedFiles() {
    let numResources = GetNumResources()

    let clothingFiles = {};

    console.log("Finding clothing related files in resources:")

    for (let i = 0; i < numResources; i++) {
        let res = GetResourceByFindIndex(i);
        let state = GetResourceState(res);

        let metaCount = GetNumResourceMetadata(res, 'data_file')

        let hasApparelMeta = false;

        if(metaCount > 0) {
            for(let i = 0; i < metaCount; i++) {
                let val = GetResourceMetadata(res, 'data_file', i)
                
                if(val == 'SHOP_PED_APPAREL_META_FILE') {
                    hasApparelMeta = true;
                    break;
                }
            }
        }

        if(hasApparelMeta) {
            console.log(" - ", res);
            let path = GetResourcePath(res);

            let streamFolder = `${path}`;

            if (!fs.existsSync(streamFolder)) {
                continue;
            }

            let files = recursiveFindFiles(streamFolder, true);
            
            let metaFiles = [];
            let ymtFiles = [];
            let clothFiles = [];

            for (let fileData of files) {

                const [file, filePath] = fileData;
                const relativePath = filePath.replace(streamFolder, '');

                let clothExtCorrect = file.endsWith('.ydd') || file.endsWith('.ytd');
                let startsWithModelName = file.startsWith('mp_m_freemode_01') || file.startsWith('mp_f_freemode_01');

                let isYmt = file.endsWith('.ymt');
                let isMeta = file.endsWith('.meta');

                if(startsWithModelName && clothExtCorrect) {
                    clothFiles.push({
                        file: file,
                        path: relativePath,
                        absolutePath: filePath,
                    });
                }

                if(startsWithModelName && isYmt) {
                    ymtFiles.push({
                        file: file,
                        path: relativePath,
                        absolutePath: filePath,
                    });
                }

                if(isMeta) {
                    let content = LoadResourceFile(res, relativePath);
                    if(content.includes("<ShopPedApparel")) {
                        metaFiles.push({
                            file: file,
                            path: relativePath,
                            absolutePath: filePath,
                        });
                    }
                }
            }

            clothingFiles[res] = {
                metaFiles,
                ymtFiles,
                clothFiles
            }
        }
    }

    return clothingFiles
}

