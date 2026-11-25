Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.203.187.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604671;
	b=yYCm1+vQ1qRtxv98vC3JxwOuJ5OT8YHW/bABwGRufb6nI1s+g/ruapWTsLfwPIVrwN8k
	 Y7BQ8IRuV+XXvpDQ+S83jQzcRDD3t4vry1UAkgnPebDWjf6Tgq21HREbcBHwLwEpddFog
	 773iKboKM6iQTRW/N/rHPXHRRyrvdeb+nKs6HRww7u+51OHqcIJSDNDCH9pwOX/Qd9G7i
	 WbnAlVO11UnaZakFSqj7L+cn8nZbOsB3SCykLcH34rbWDYFWeYt8E/k3FjX04Dh7fhJoo
	 gYakcdg6F9wSQiMkoe8GPJGss3+YZGVoKZooKUKapm1h55zqvp3FqXqhnyLB7vVKikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604671;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-Auth-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Classification-ID;
	bh=/1Gj7IvUx7FrAw+gzFpkzUkO9qKuI1oLpxyzvSDSlY8=;
	b=QzC3qoU1UW9aQLIuamTpDIP7NQxioyWFko6rjRU/j4QZEsJ51ixfcgSmDn/63kbX4kay
	 LhSe8mZgFQrWiBMuOZ9CgBdyN7iwGyUgeW4UpEShCwqYJWStWAji0QbdEvRTyOLJkfiG7
	 jD9H9+ZcgJnl4IJk0a6bhs7YSyY/kcxZjl5ez00JPVFS//oQhnSI04nG1pFkRlwdlX8w0
	 Io9Uy2/tTqY3svh/zeVe/5TllLB9Qt5uYYhj+BzBhXIg+WtlKC99VDszszXe/J35S7xWa
	 cNfOs2h8W2Ijf1+wphhmN26l+UqqeNAVMT8rAhZLevXYRVEoHE0lnyPmoDn/TW2L+/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mev.co.uk;
	spf=pass smtp.mailfrom=mev.co.uk;
	dkim=pass header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.a=rsa-sha256 header.s=feedback header.b=O3qDekBG;
	dkim=pass header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b="pvMcd/VG";
	arc=none smtp.remote-ip=173.203.187.106
Received: from smtp106.iad3a.emailsrvr.com (smtp106.iad3a.emailsrvr.com [173.203.187.106])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B32606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B32606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=g001.emailsrvr.com header.i=@g001.emailsrvr.com header.a=rsa-sha256 header.s=feedback header.b=O3qDekBG;
	dkim=pass (1024-bit key, unprotected) header.d=mev.co.uk header.i=@mev.co.uk header.a=rsa-sha256 header.s=20221208-6x11dpa4 header.b=pvMcd/VG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
	s=feedback; t=1795604664;
	bh=+o4lQOUcnLmB5xQaJEIxUTKlNZk9WL8bxXIwWjtgWjU=;
	h=From:To:Subject:Date:From;
	b=O3qDekBGDXm3UMWK3Gtes/EILPlTq7J33jbvEeGoRTTopAFyC+YycUGyRipBF60+q
	 FnYbZnOL4QmVvbUC1hpaEMpU3+wU+rfxTVRdg5zsbqL3LoSKRn8IwatIcK5IABhLFn
	 pijaYPzsJkS+qeP/xnkWCa20PL/abO3Zo8w7U5Yg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1795604664;
	bh=+o4lQOUcnLmB5xQaJEIxUTKlNZk9WL8bxXIwWjtgWjU=;
	h=From:To:Subject:Date:From;
	b=pvMcd/VGTpvXL8ZVkv3SHZU5s4JnIbkygrmbbv63cy/uWq1slMH42FqwNjPkWubgs
	 p2PWlNUcTszW1YV+FB+qsmJ/8pcE7LXxvIKDveoYHsvxRgzPb1pAh/WtA0oiOMxoSP
	 kcDWk7lracTJ8eP1GZEMId7a4kqDuV2kDBQimPm0=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp6.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 910CA54B5;
	Wed, 25 Nov 2026 06:04:23 -0500 (EST)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Jeehoon Kim <Wlgns2756@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] comedi: adv_pci1710: prevent NULL deref in command test
Date: Wed, 25 Nov 2026 11:04:06 +0000
Message-ID: <20261125110406.70945-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.53.0
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
X-Classification-ID: b6340151-2788-41bd-b58a-8a5cec7d917a-1-1

From: Jeehoon Kim <Wlgns2756@gmail.com>

The COMEDI_CMDTEST ioctl permits a NULL channel list: do_cmdtest_ioctl()
only loads and validates the channel list when the user-supplied pointer
is non-NULL, otherwise it calls the subdevice's ->do_cmdtest() handler
with cmd->chanlist == NULL (and cmd->chanlist_len still bounded only by
len_chanlist).

pci1710_ai_cmdtest() calls pci1710_ai_check_chanlist() unconditionally in
step 5, and that helper dereferences cmd->chanlist[0] on its first lines
(CR_CHAN()/CR_AREF()). A user issuing COMEDI_CMDTEST with a NULL chanlist
pointer therefore triggers a NULL pointer dereference.

Every other comedi driver guards the step 5 check with
"if (cmd->chanlist && cmd->chanlist_len > 0)"; adv_pci1710 was missed.
Add the same guard.

Signed-off-by: Jeehoon Kim <Wlgns2756@gmail.com>
Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
Fixes: 56556577d9c4 ("staging: comedi: adv_pci1710: don't check the chanlist twice")
Cc: <stable@vger.kernel.org>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/drivers/adv_pci1710.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/comedi/drivers/adv_pci1710.c b/drivers/comedi/drivers/adv_pci1710.c
index fc749241da416..aa0e56df4d368 100644
--- a/drivers/comedi/drivers/adv_pci1710.c
+++ b/drivers/comedi/drivers/adv_pci1710.c
@@ -621,9 +621,9 @@ static int pci1710_ai_cmdtest(struct comedi_device *dev,
 	if (err)
 		return 4;
 
-	/* Step 5: check channel list */
-
-	err |= pci1710_ai_check_chanlist(dev, s, cmd);
+	/* Step 5: check channel list if it exists */
+	if (cmd->chanlist && cmd->chanlist_len > 0)
+		err |= pci1710_ai_check_chanlist(dev, s, cmd);
 
 	if (err)
 		return 5;
-- 
2.53.0

