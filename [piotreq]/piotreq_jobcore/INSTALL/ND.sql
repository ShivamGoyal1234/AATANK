ALTER TABLE `nd_characters`
  ADD IF NOT EXISTS `dutyTime` int(11) NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS `piotreq_payouts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) NOT NULL,
  `hours` int(11) NOT NULL,
  `job` varchar(20) NOT NULL
);

ALTER TABLE `piotreq_payouts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `piotreq_payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;