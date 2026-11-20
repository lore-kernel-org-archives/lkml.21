Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186717;
	b=DgnUjeh4ygDiGvzd0x3lrDyifBnzIGXVJke0qtuWVO+euL6mWUko3F4o7cwlpRwpOIMe
	 1oJo1JlOTrZvJjRSjKQcFca7UEaFDkhDuoemLVdF1nKkJxuF+AZU1q5pgUc7d3EB1EQsC
	 AYF083/F1gaT+4m2n1zt32HS67R0wjmzQanZVII0zXCW+vQul9ZToskZGhReG4QdLoJb/
	 2Q+4ApWlYr+fpZSHSqqWfgBMz72D3jYjAxshWTKgTRHgHmf+IrmBOHfi653WBzTWirb7p
	 oKA4oy4TVAcFlSS1Ro9cMhXI6UFMwAN8BtWgxhNrt+/Zu0W0lXa17HAVs/oG3LNxQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186717;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=tm1WIg0O1FFv6Tly0Qt5Lzt9aOxoUsNmPJ767y2Zuf0=;
	b=JM65JI6VqMs8P12TerIYRodg+rUJEmn90aukcSG3JTZWPvEwPb7EV0txAliqQIRDsDja
	 Ejjcnh9hbMqrdf65O5LgvJtGjK4EgmVpYaqg5uNXf5r7aBWRLmCNlikStTXPKuO/GJopA
	 5NEahvG01Hyg/Bc31eCEMjhx7FKPaNhkseIOL4WozayazPs0z9Vj1tlDtNedoMbK1NXsC
	 mxRUSXmsZSOxvwLf2VH8VmpAHG/0Lw2SHrcoKJszpnFTTGJYVJZTw0R3M8ChMOUMM3oKg
	 mvCVMV0tIocOb1WDTGvrWXWE+f+/feugTAqdQEZrnMgxWX2Qyt7N4Ncjy+rkDBeCaSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKllHen3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2758160A2636
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKllHen3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD02A1F000C6;
	Fri, 20 Nov 2026 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186717;
	bh=tm1WIg0O1FFv6Tly0Qt5Lzt9aOxoUsNmPJ767y2Zuf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OKllHen3/BRHO8tIIFT0wGvq/Upr6By1pPTklhPNrfJ12T2gemm8kkrymzNRt64H1
	 hH32b775X3zTl3PwiHhrqzdo0Eg2RE6F800dAFIZF/WIfXJLi/HEBuJrd22JBGZE8H
	 n9Ok7WEXdgH5xkv5q2dSJeHgah/7cdLNa5i6MRcLAt+XFxLtvPe8Ze20Kmgu+YgRTW
	 Nro44ibddHnCLy7vj/Llb2rKKRUMLIbHhnmNi5oxwE6UenpCXR6Y6qiXOaNB2ad2fn
	 OCpbwcW/zTSsAhaRykm7fq/X90z+LMLFIMYN83RGOo/QGHYvV/MDYljGx2SvxnzR0K
	 JfVJ0gNbqXD1w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:40 -0600
Subject: [PATCH v5 16/19] accel: ethosu: Ensure cmd stream is multiple of 4
 bytes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ethosu-fixes-v5-16-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The command-stream validator consumes 32-bit words, so reject empty or
unaligned streams at that boundary. This also prevents QSIZE from
receiving an unvalidated trailing byte.

Check that the second word of a CMD1 command is within the declared
stream before reading it from userspace. A word-aligned stream can still
end with the first word of a two-word command. The old ordering read
beyond the supplied size and could return -EFAULT instead of rejecting
the truncated command with -EINVAL.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - Also check length before get_user() access

v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index ff89cfdb4772..fc31372a2c08 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -977,6 +977,8 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 
 	if (!info)
 		return -ENOMEM;
+	if (!size || size & 3)
+		return -EINVAL;
 	info->cmd_size = size;
 
 	cmd_state_init(&st);
@@ -997,12 +999,11 @@ static int ethosu_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
 		param = cmds[0] >> 16;
 
 		if (cmd & NPU_CMD_CTRL_CMD1) {
+			if (++i >= size / 4)
+				return -EINVAL;
 			if (get_user(cmds[1], ucmds++))
 				return -EFAULT;
 
-			i++;
-			if (i >= size / 4)
-				return -EINVAL;
 			bocmds[i] = cmds[1];
 			addr = cmd_to_addr(cmds);
 		}

-- 
2.53.0

