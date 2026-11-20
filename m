Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161227;
	b=ad74a251Z0IY2RuZgnpF16f9uK/toH20s/HVUT/eeC4w5XVHFlI2soqnmVSY8repr62I
	 IF+AVehire03hFraE2NMu40synP9heCQvMmjfa5iJLxhdGzI5dmoTgZ6t13kbjzTcQlZ/
	 aA6Z787Nu1sKS3iQf//CjX1gLEnJd4CRrK5ckg99M3GJ0/xGQQBPX3M+ksR8/4zUjt/lh
	 eYg1IczqaUCRR2892UczsWSN0sBQwKr0E7o6+TEtMSSxQlny+KDaCsvrRtBaAzi7jUQ4G
	 OA2MeE1JRjhqR9+6Evn44IkGllKDnPHgUC+BIZVdF+QiHnDQWD1TPgMGZhnFsGWr7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161227;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaF+rmxtC3GqtPJ6J932duj6LKs7x2LwNY6gfCcbaCs=;
	b=OFjYYS/lxUH9uoQkAHnyoZXSoP9kyvY6OVbDJOovMAEunkTC7CzENt2XdV8mGm3p0k7J
	 oq6odgg3nQv2utBhht/e9c1kT/iqTQv4smund2o3+7SE9infU53Ia3YnyzKJy7tv/xjLy
	 RgkGmh0hLdJGnYe9Lgyd5F+BS1rVLUKc1z7Brm6prJuUOEKGPmrJYvMUXdXMtIMudrrM3
	 UNvEEZjmDPUVkhLyzMBJ3f9EqHVCcp6UgCUNi/NAjFBzcfZ78wWxQExk+fu7fC/jzzFBj
	 wjCyF/tB8jrrdgJNHdGjB19oZeGcU/Ax3a7j53Z4wd1nfqfzmMo23DqlS40EIji2AlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE4606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AE4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7f592de2e4b711f19a56ed5b684f684d-20261120
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c329d75d-bbcf-4dfd-816f-13e579cbd64d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:73dd7473d614ad41d298eae4d82ec331,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7f592de2e4b711f19a56ed5b684f684d-20261120
X-User: zengxiaotao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zengxiaotao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1278361121; Fri, 20 Nov 2026 15:53:39 +0800
From: Xiaotao Zeng <zengxiaotao@kylinos.cn>
To: pasha.tatashin@soleen.com,
	rppt@kernel.org,
	pratyush@kernel.org
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	duanchenghao@kylinos.cn,
	zengxiaotao@kylinos.cn
Subject: [PATCH] liveupdate: drop redundant lower-bound check in luo_session_ioctl
Date: Fri, 20 Nov 2026 15:52:52 +0800
Message-Id: <20261120075252.684604-1-zengxiaotao@kylinos.cn>
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

nr is unsigned, so for cmd values below LIVEUPDATE_CMD_SESSION_BASE the
subtraction nr - LIVEUPDATE_CMD_SESSION_BASE wraps to a large value that
is already rejected by the ARRAY_SIZE() upper-bound check. The lower
bound test is therefore redundant.

Drop it so the check matches the one in luo_ioctl().

Signed-off-by: Xiaotao Zeng <zengxiaotao@kylinos.cn>
---
 kernel/liveupdate/luo_session.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 74bc66929f4b..f1b86f701238 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -413,10 +413,8 @@ static long luo_session_ioctl(struct file *filep, unsigned int cmd,
 	int ret;
 
 	nr = _IOC_NR(cmd);
-	if (nr < LIVEUPDATE_CMD_SESSION_BASE || (nr - LIVEUPDATE_CMD_SESSION_BASE) >=
-	    ARRAY_SIZE(luo_session_ioctl_ops)) {
+	if ((nr - LIVEUPDATE_CMD_SESSION_BASE) >= ARRAY_SIZE(luo_session_ioctl_ops))
 		return -EINVAL;
-	}
 
 	ucmd.ubuffer = (void __user *)arg;
 	ret = get_user(ucmd.user_size, (u32 __user *)ucmd.ubuffer);
-- 
2.25.1

