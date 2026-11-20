Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164055;
	b=vcAvJjpTV/Tia2nRaU47HOnuly4dEjSuiAR6Gb7u2rQn0fPmobU0mrbZAe4cSAy5Pyhf
	 mjN2wSXIxwdFF9AeY6OUOI0dYzJhN2uf3Z1cQe/M4OD/DFuTfmgSioXmGrN/kB2sBxSmn
	 1E4tyBFp7guREWLGjaE9ozkTv8T4/V+I+xDhNfjRRHatUdvxSlOVLiBYrsHw3Djb+48Ds
	 XJL0DuwridJ+zzL1RygLJ7j2sxhwKVnLXtPN1rGmmk/evRm5VFIbBCLMcdAxWWwJh7Xtk
	 0laFPsEY7HjvYN2UpdWvtvwaJAvSVTXPLBo/Glqkdhdxm8scVG/ogoFhbfo8cnM8ZfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164055;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wB5TcM3TKDwZOHSt+qV1TwEFeoH9YjtD3PvS6F3A1ac=;
	b=ILEca2aNhF2Ed6jMOoNxtvUIg4hsGx44xtR9YrejRWNNFf7xkRvKmoO0TE/4FoQ7y7qT
	 duvTXbHPCTyakLB8nneQlquOvkCXFNvldhsBQ60lr6ADMmnO1OviJL9KqNqmDEKIHYmvu
	 +57zPm0q9nxlrdGZlhkJ+3BZEYhoRdlvveBESUHVnuF1fIxR+k1uHb4BqP0OWiCz8dcmj
	 +tvqJZFKT6Bf0LWyCXlI9M04ODo1XRW78r+PwcAY7JbrZ3Dn8EGAypOVlAgFYZTzhCKJD
	 z6AFW9IopEgv78obtYl6VDKrhX4Qjmlz9JeWFCVw5+/5ylc7nnNhyMyE+7EQvN8gUEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Krs+74Av;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AE9606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47AE9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Krs+74Av
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Krs+74AvlQOgIZ4lmMEArzL83mE6I0NKSD+QRwQ8t3wNvIKxRLX6VAqrNoNYeoXEKbiL8YcomTqcj
	 s9eLxFF/fbovTQ96sdV/baWVV+azUC/CKea8S3P3gjnNSUILD4T0kYnWGfwMYAGIZg5ocRDe2kX9oT
	 55dkyMP9KDHRzOYg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b00078eb95-27be8;
	Fri, 20 Nov 2026 16:40:46 +0800 (CST)
X-RM-TRANSID:2ee76b00078eb95-27be8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66b00078a732-1e62b;
	Fri, 20 Nov 2026 16:40:46 +0800 (CST)
X-RM-TRANSID:2ee66b00078a732-1e62b
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: linux@treblig.org
Cc: jdmason@kudzu.us,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] NTB/msi: fix error cleanup mw index in ntb_msi_setup_mws()
Date: Fri, 20 Nov 2026 16:40:39 +0800
Message-ID: <20261120084039.1954-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

In the error_out cleanup path of ntb_msi_setup_mws(), the loop
iterates over the peers configured so far using the loop variable
'i', but ntb_peer_highest_mw_idx() is incorrectly passed 'peer'
(the index of the peer whose setup just failed) instead of 'i'.
As a result every iteration looks up the highest memory window of
the failing peer, so ntb_mw_clear_trans() clears the wrong window
index for each configured peer and the intended translations are
left enabled.

Fix it by passing the correct loop index 'i'.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/ntb/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ntb/msi.c b/drivers/ntb/msi.c
index 6817d504c12a..13e9f52ec8cc 100644
--- a/drivers/ntb/msi.c
+++ b/drivers/ntb/msi.c
@@ -154,7 +154,7 @@ int ntb_msi_setup_mws(struct ntb_dev *ntb)
 
 error_out:
 	for (i = 0; i < peer; i++) {
-		peer_widx = ntb_peer_highest_mw_idx(ntb, peer);
+		peer_widx = ntb_peer_highest_mw_idx(ntb, i);
 		if (peer_widx < 0)
 			continue;
 
-- 
2.33.0



