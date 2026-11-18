Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992116;
	b=GKSot6ctpyB2BicqLYc94mRGASVWpJqmPKMQHHmDbxSUGmZ3WoCKMiTd717kSP/TTFzn
	 l61Ydjg2BixS3fLph6vZOBxKirWrVKjFpmILpzsBTDyGOknlbBwgepz5bitgmPhQ1hSEU
	 3QRIJ8Q46ie2SiUEWgLI2dAk8TRCeEQp+o0xwdH7qeaBwPI+RobDlvUlGsI+HbE5PMgN7
	 kWfxCkE13eeZDNRocGEPiTM/Zm58/aoxaixyg3swWQQc1DW4abmeowg3jEtxgp/UCJG/N
	 2S8sy68UmJMB2yIdmjtVFDrzR88Ndbz5NzWOpBfim/YdjaPLMG43fEHrPWrWmlB7MwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992116;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fo4zGbknT06eWfnAhh1J7rc7bQjqMVN64q0sdPHY7FY=;
	b=F2rI5Oqoct7R+W7K5FaI7gRi+tLUxgHDxN9YPet0Dqi3VavAVK214HtE3f6XMqGwWZNu
	 qVA+q3HOi/oP7l/AIqzG/PpzKE35IAlVPyjbUqUzqpAn1bv6jZfzJdBQVb0yiSi5ivfzK
	 CvGkMHhCfiuab+CCGY2wtQQ+8BybSkJU1eK7pC3AAI5+DrMP+bY5fsvTX0wLI7Juxu2ae
	 VW8a3Z4+fnCGIATJJQHTAY0xmnIMTJbdv0wIJC5Yb90aku7vKEFwpI1MP/fbrOi4gQYt1
	 ySybl946V4ECRX9zhxjKAWCZ6qEXcFRXsPB+kiis0LSRGdooZ9sfGxAu/fL20x7tM8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D024606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D024606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bfabcda4e32d11f19a56ed5b684f684d-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a8f6efcf-226f-4d48-831e-3dc98a10beef,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:7db8b62,CLOUDID:4db1f5e7feaddf4bbc4f6c2c005fc0ad,BulkI
	D:nil,BulkQuantity:0,SF:102|123|136|850|865|898,TC:nil,Content:0|15|50|99,
	EDM:-19|2|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bfabcda4e32d11f19a56ed5b684f684d-20261118
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 504405037; Wed, 18 Nov 2026 16:55:05 +0800
From: yaolu@kylinos.cn
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: michal.wajdeczko@intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/xe/gt: Abort GT init on LMTT initialization failure
Date: Wed, 18 Nov 2026 16:54:53 +0800
Message-Id: <20261118085453.198348-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

From: Lu Yao <yaolu@kylinos.cn>

xe_lmtt_init() can fail, but gt_init_with_gt_forcewake() ignores its
return value. On a PF the probe then continues with a half-initialized
LMTT: lmtt->pd is never set (and lmtt->ops is cleared), so
xe_lmtt_init_hw() returns early and the VF local memory is left without
a translation directory while the driver still reports success.

Return the xe_lmtt_init() error and abort GT init instead, as required
by the documented LMTT contract ("Any LMTT initialization failure
should block VFs enabling").

Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 286aee5775c0..1239cbb7c84c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -582,10 +582,10 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 
 	if (xe_gt_is_main_type(gt)) {
 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
+		if (!err && IS_SRIOV_PF(gt_to_xe(gt)))
+			err = xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 		if (err)
 			return err;
-		if (IS_SRIOV_PF(gt_to_xe(gt)))
-			xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
 	}
 
 	/* Enable per hw engine IRQs */
-- 
2.25.1

