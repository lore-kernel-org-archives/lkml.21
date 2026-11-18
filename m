Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962275;
	b=hIrQ+g0HJ4jYBSKvI3mnV4RSBdcvlEnjiEPTbm2DjXY6yjgbCJWsSZ6mbc78XsBHctXf
	 IMD0xqXAsqEeyF0i4PDCQL43K2U/4NVpma7nsxaIcAxeW0GkeEmY7dtrNDmPR+BmNlGBC
	 YlXG1AXXsmBe9JQ6YGdIK5HOK2I9g0NuX7zEG8cMeY35AdaVCPRHafVVQ4I0yjdKs2lk3
	 PZonb9SDwgEQ6/LRsnzXc4+brB0FILjtTgNRVMUN3t8lhc/Q2kZkA9FTBhdEH1PorTUIS
	 O1eikCZBGMGTSE/mkBQlq83iwNnQT++Mb4DOUY4uHSw+wdB9O0OlK/peThC48Teba5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962275;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gl+aaTATQ2KRJxVF4z9SwTCbT82XPOKKnt7ahoOCu/o=;
	b=VxeBkMhAVrQWMiMK2VeZ0rH3nsE/vGZTtLFaJ5x0eZC7F3ANtM037FBWkS8qCapcDc84
	 ntNAiNp7MuipTAMsiSWeC658IOVDecd/wInMx/jXb9oUEw3ewQUMddRKJQZsSpPWJ307e
	 fAEVRoslD2yJtHrRFwaiir0lyug1VXrG4N5ZBbYrbHpPnM/8SFhISoNIzSEoA8GF04iVn
	 +srsqDVqvVdqYoqAOLw3xaHp+h5mxovfOyEXtD/wciqwDb94B3Yb7ghixBdk8KeYVzf/t
	 mj0jq4/8yTW5LGmrIWlCNWK2VPYqRUQUtXVu61GW9HPADej3E4Pj5K/7hU/65bOZmMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timdoug.com;
	spf=pass smtp.mailfrom=timdoug.com;
	dkim=pass header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=UjYD0ywm;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FzxN+z1g;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13F606A88C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D13F606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=UjYD0ywm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FzxN+z1g
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 586A11400195
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:37:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 17 Nov 2026 19:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794962269; x=1795048669; bh=Gl+aaTATQ2KRJxVF4z9Sw
	TCbT82XPOKKnt7ahoOCu/o=; b=UjYD0ywmnt9dd7aWc02eM821Y3eRBUtC/PfBb
	q9jQYBVStjTb3HgeUypBlLB62o3BMwL/Ys60zEuUZGLcg+pdNtuchPd4APBat8Bl
	L7IE6OkuexU8DT0/IbuAB5M8a/NGhxBOOYHiAsyR4wwuEEI8qw3Mu7hWhD7KGYH8
	8TnsYZwgcAJGP0IuiSaRK6WBDWJ4oGeHGi6gj3k6BokiT1j84m1g9Ib0rBYacuj5
	SjofI66buNS9uSPB4MgCurIHwmOUXk/ZPqi1v98kB/myG2yWk+VuNyMnOcVkJjIo
	ABKuwm+ayfPzW4mj1ZPPgYXSQTrcIgdKjEVlrmJPUu5Ta+ZWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794962269; x=1795048669; bh=Gl+aaTATQ2KRJxVF4z9SwTCbT82XPOKKnt7
	ahoOCu/o=; b=FzxN+z1gIroM3Pw/3+SJnlKfohLhPvicSQWOjlp2PMUpXf1xR8d
	cK00Lm088UCeZJPEDdsuB55EmFjFuATd43DHrne2YBKINs0PT2KTK9RZBmPuapzF
	ItLfc1OegcVfcnexhEQuRkgpXNb+WzTPwS0akuey9+rkPbxm1pAFftbm3n8jrrod
	2qDgzZy6npdgiFv1flO+biJ/jbZVYzMfR7FXU6T1Dq3kk0H6tR2KBr6zW5JE4sTB
	BaF/4hO+D1LViJYWSsdnrHC3dVFBOacMzxX2CljY59CkqUrC+oUPA76AnJQdJr9V
	hOiOUbvRCHZIqp2hZBDJQqSFCSP9EvBsh4A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794962269; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:aQCmT1IIfRylgev/BlLWYLOdXkikau3LiK9gbFbwF1qKY5B
	FsvV7MBPaQpLc1Xrq/3y/uSiogA0nDgkeZt6cFLVkW9cI2CYsXrKW1O1MsUQ2947
	saetYbKTLN/ntAw1q53mibt8HM5jCO6WJkOgdDsKQt4bN0MaYHYdZZfY+OoQzfRt
	s8akMIKWtI9moQ3GleAg6PQPb0MM58QFmHFfgZkbOf96cGoCVB9Z+6ALhhV/06NK
	h2QSz95MK+glT9X99clGhfwEzviGNO+6NcxslOeR8bYgd3jeE87kZ7/rWiqrFDbC
	Wk1sMPdnRQxtXIrTFlcOiNEcvtTohS4MfMa/kyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:/i9ZMQhVfq2717dxIHz5tE//9o2ryLOZSjy0XCiQha0=:075IwewuD6A84YFV7v16hi4kQAzEPa+mYI1MYxvovpM=;
X-ME-Sender: <xms:XfP8agwhn-uOVcXxi7-AWZRgzV4BhGP2GnoETnPuvdXouRGHcSLNKA>
    <xme:XfP8aiHooQKzCqnQIJZ7XbNZtCcQ82a5eYO5ObeQOBwZ6zOvzglGQnU5YFfRlgzKj
    CIn3exK0SgC9bVyPRWfSHl1O2wbINi--IqmapUxfDz2PKoNckw_csM>
X-ME-Received: <xmr:XfP8asyxKt-kfnJUXj7M4m2pq-n-jCKfAJMDt47XxTuWx-QDlJr2WDhuuGHJ>
X-ME-Proxy-Cause: dmFkZTF3DbEPOX5/LLA/DdAu1FRq0OlLGtI6fp+qMpuG60xJRrurkOKPkKfNqeqiSJYJDh
    Mn0QpNQFDRQ9xQ/TuSuG/8ch4A2YkBEjAQxEGfsBdcZWhl2pZhNEvdaCGPeD6nXbzwrWcW
    JIZnZt1zwWlwRakF9AijsGm2O6cVjbOqJOhenYcLcUAs3FYFjMMUJlsMwa9T05/Z/aG03Q
    5Tpf/chNyEWGfSQcuseUNXznAtoe1wrXYS7LByaRGticp7P16jjStdkAiUzVKoeAJwIPme
    3gFNJNQloYwludwUnN9W2AqGKmKX0tFRd0RxLyGAjjsfF/EfvbxvuYhowE5cSsPyGxY5Xz
    AP89B5PS4/tNG89gaA3O0x0SRgTbxrCkasYMXmBR3i/yE9Gz/1BPNa34XSt3foODeeQSIp
    0gSDm7Dk51U0T+2mcGzOXXtalWqKNx/8j5DUOIrIW900fhNSLM3ACOhg7EQ7EmZVpQuaVX
    SQfuAvsKSLN4uGAbBC3MMp/oDCQg3bWJ6W0reZVo7odmLQ7Pk1KZ06No/VgRrg/lxH0ETE
    Aaj2Wf/VeuYxp6E7f0JSNIQxCcLugd+05En0hg+8ZKS3tSeCe1PmX86um8lftLPnQ2zAhk
    IH/6SH1vAuqPDDyRZ/QraDDdwkJVjtzFkmNmZPQywrlaWWIy5TK1ziPrpx0A
X-ME-Proxy: <xmx:XfP8artJkX_lCf2PSfEAhET6aTSDb2lCkBSRjP4On96u7hAMpn7gmA>
    <xmx:XfP8ah16aYPrGp7mtjz7FklnXHhGPYcc9PoEMSOwKLX0KCGbcRkFdQ>
    <xmx:XfP8au_yh4s2xXCzEZMfu1zye7_c-zJqePZS9xbV5F7womB9J8MQWA>
    <xmx:XfP8aqO8i2ZO4rSwD6COsWB-IUSoOKDU7D5losTWK4kjbWBl1_S8Rg>
    <xmx:XfP8apxjeM2NCqshG4qy1XbQbkXwwxRP7LjZ3oxmAFidj1V6UL4sHp5e>
Feedback-ID: i12bc4175:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 19:37:48 -0500 (EST)
From: Tim Douglas <me@timdoug.com>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: esp_scsi: report the residual byte count
Date: Tue, 17 Nov 2026 19:37:46 -0500
Message-ID: <20261118003746.61659-1-me@timdoug.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ESP core tracks the number of bytes left to transfer in tot_residue
but does not report that count to the SCSI midlayer. As a result, SG_IO
returns a residual of zero even when a target transfers fewer bytes than
requested, as can happen with INQUIRY and MODE SENSE.

Report tot_residue with scsi_set_resid() when a command with a data
buffer completes with DID_OK. Initialize the scatterlist DMA length
on the identity-mapped PIO/pseudo-DMA path so the residual starts
from the buffer length on architectures with a separate DMA length.

On a Performa 6200CD with an out-of-tree ESP front end, an SG_IO
INQUIRY with an allocation length of 255 returns 36 bytes from the
internal CD-ROM drive. The residual is 219 with the fix and 0 before it.

AI assistance was used to investigate ESP transfer accounting and draft
the fix.

Signed-off-by: Tim Douglas <me@timdoug.com>
---
 drivers/scsi/esp_scsi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/esp_scsi.c b/drivers/scsi/esp_scsi.c
index 9993b0ae9..162f8fe14 100644
--- a/drivers/scsi/esp_scsi.c
+++ b/drivers/scsi/esp_scsi.c
@@ -388,6 +388,7 @@ static void esp_map_dma(struct esp *esp, struct scsi_cmnd *cmd)
 
 		scsi_for_each_sg(cmd, s, spriv->num_sg, i) {
 			s->dma_address = (uintptr_t)sg_virt(s);
+			sg_dma_len(s) = s->length;
 			total += sg_dma_len(s);
 		}
 	} else {
@@ -907,8 +908,11 @@ static void esp_cmd_is_done(struct esp *esp, struct esp_cmd_entry *ent,
 	esp_free_lun_tag(ent, dev->hostdata);
 	cmd->result = 0;
 	set_host_byte(cmd, host_byte);
-	if (host_byte == DID_OK)
+	if (host_byte == DID_OK) {
 		set_status_byte(cmd, ent->status);
+		if (cmd->sc_data_direction != DMA_NONE)
+			scsi_set_resid(cmd, ESP_CMD_PRIV(cmd)->tot_residue);
+	}
 
 	if (ent->eh_done) {
 		complete(ent->eh_done);

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.5

