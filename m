Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674199;
	b=uMcUsWFp9fR+TAvo6LtEc1wPbmgMIdVeHSfaYuFs94XGO/DotuoOoU3Rhw4sJPMblIe1
	 t9Dj5BR5157IfZWoEFhwCsHj+Ohx9MAGZC1LyGOVQM/8GQXH+yxKih5S/ajeE8VUAi2NO
	 THe9efkcANaSMyD6R0vJHakozmJgltEqQscSzfWLiIUetf3ugL6V3HN2/H12uh6NTdNiv
	 e0/+1CwRtP+1ArOeb5V9m18yfn+Pa5PMN1O4HEEtsPGkFVjpeduWyHkXdLatmHYY3fDMK
	 SLbp29qGToiTr+z0xS/g5TpzJ9ptPKDdRuXBzQwZAFewRgeIfTpDS80r6VIxXxRUD7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
	b=2fda8YNVu/lixN+WVd6mqWtcGDkPkggmQTwsKRhhmDdon2y91aZsBf2nhRriPiZjVzeb
	 xjuMj+yP2CrZ4MCqOElx3QT48nvTr+cEQgBeY3F8E86e+ufGPOgmApnLXNgU7qqDFdtkk
	 WYE2WcIh2AYYqBDJaJAdmNqjUOMVff2CLzbYUglGqmZySmumf/VSHfkOk+2hxsQP/wGjL
	 EsSQbb9Qq/0CEpEv5jQ/AXsMIamYcNAXfVGtyah996pYXDndBd5DdB3mCQf/bLpeR656U
	 /G+kCuj+eN1uBxyKsjQh8ICRbI41sgfsHHHLo2klstP4rPE/NFNSRbDKnBb+JIWDSog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YACbua7o;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB50606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB50606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YACbua7o
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02f04a426so54493825ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674198; x=1796278998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
        b=YACbua7oSN7sJw24HYX57m0e9cVdc1sjtYLdAIvO3Cg3hutEKad156pvmOXb2cEj3W
         pET12Z7zu6/oqTMbLIPxRWZxdAOyxPa3evc9VAD4XfUfNOHSV2e0CiD9OvSwNh8ND8MX
         3wbd6UmrU35bE/ykoZ+nC8Jr8UKnnRU1l06r8J/MhvMz4Z/Egpmjzj51PnH5KnWxhIly
         ErJIyJUFHfxnz8ZWR/nv5uFtbZ1VA+uNYnR3wpts0jwh+ViEMYs7BNUq5FiXwAt+DJ/G
         Fo5ADZQozTr/arFscBB9uNCCUOOSCu8Zn7/ANmdhJUl46PFLQqdXGxp63uz/7pawIzbM
         TI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674198; x=1796278998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
        b=B9dbxoSOonWqHyA/3vK3nOk9xoneXKz37b7ySBuXWz419a83pqozvRsfBEUSy8fJCI
         HuAhACaFdBd7fnZhYd/icEuNcwUJGfz2kst5SMtBlPAfmt1A6tjKSUytyYNbZNZVqbaT
         VoVlJ0UIk7p0nzrVuDR0GjKnnlKfGlR0dgBh8py78TVDElAb79s9aTN+V+dgANjnhPeQ
         N6jeTAFdCuqou7qNkZIfHLk5O8LzfZeTTRLOZpjz4rxdpxKuU7Gkem5QuJGYSYP1wCPC
         2Fu9Dz9CbLiVdMuPWbrVaihK3KPYEkAzass4TfIb9q1JZAIv5DCW8Y3LcWuA5yRB37KL
         D7ag==
X-Forwarded-Encrypted: i=1; AL+hErG3z0jqmDKmli7PGeUU8gR+g787YMVAsvuIRTKRWNZjBEJzw590QpafrI7ti03yMAKNxjNUXoZE0I1TIF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dm1okEo/h+Ix4pitlo9tdY63CMGeBpdt8uP5iDoYjrn8GhRIQ
	PIrtpq4BqsJuRLDieuhqc8GyqajK6LYpOs6W9hGMHwBMHE5H6jJFRydz
X-Gm-Gg: AZFdTZek7xann04H43Y4C0ew1CGLwkQHRGzeYYCbTg/VHGdIMbQ0hbusdD9tJvmqkLK
	F9cv/Mp3o4w+Vivih/MxPiWnatqSiTS5Igm9KMOze3zT1S5oOpBZhPGPPH+9N9FdnsTRYfrJMzq
	7jQRIV+n7y0lPDpqagM+yfgLYKYN9721D+uxA1I0DxoSUkXzFWYiUxDSj3MD/hslz/lTJz56JAh
	rNea8Pvae2esoXU5eJnogljVPN41P202J6wX61SCR8o7pTXfNNWXAy2sk7dubh981ilXPtNpICU
	AYA5ohzjl/yWIg9PzkPKk5iQPwefmPvFvvhlHXhtcAYd/CYEjChUJkcZKw2W0o3qkxNbZ2olfXy
	mnEiKkOYog1FxZPRhUgIWh0BX3Fhbmi2T4AXEg5fGnDPmPiXuS4yPnLmH66zLke2ZWziRomYU0l
	BCtVVPrr/HRiweplz1mHQcPMR0l7+HIxCfB24nHFdIIRvapu7hhf8EEL5r3ZinRcT/Yr5VzopMy
	Letcfbo8amkjkAVAyoqawW9o7ElmH1eL821P0NMxKL/peco7nyBLaMSc4UMU3qMhGlPEp9d824l
	KY8W1VbbZrUR+dzXocfnZ3Paek7ycXV5QHGu8KJ7kp8EMIqMhMdkS5y1k8ZzKe22Nduu
X-Received: by 2002:a17:90b:2f07:b0:3b5:a68:297c with SMTP id 98e67ed59e1d1-3b50a689b5cmr2618272a91.66.1795674198424;
        Wed, 25 Nov 2026 22:23:18 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm18122486a91.0.2026.11.25.22.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:23:18 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	mfd@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] mfd: rz-mtu3: Fix MTU5 timer start register offset
Date: Thu, 26 Nov 2026 13:23:07 +0700
Message-Id: <20261126062307.53943-1-nhat.tranminhk2@gmail.com>
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

rz_mtu3_get_tstr_offset() returns RZ_MTU3_TSTR for MTU5, which is the
index of TSTR in rz_mtu3_8bit_ch_reg_offs[], not a register offset.
rz_mtu3_start_stop_ch() and rz_mtu3_is_enabled() pass the result to the
shared register helpers, which add it to the MMIO base directly. For
MTU5 they therefore access offset 0x002, which is TMDR1 of MTU3, instead
of TSTR at offset 0xab4.

Reproduced on RZ/G2L SMARC with MTU3 in PWM mode 1 on MTIOC3A and a
temporary debugfs hook calling rz_mtu3_enable()/rz_mtu3_disable() on
MTU5:

                          TMDR1 (MTU3)   TSTR (MTU5)
  initial                     0x02           0x00
  MTU5 start, before fix      0x06           0x00
  MTU5 start, after fix       0x02           0x04

Before the fix, starting MTU5 switches MTU3 out of PWM mode 1 while
MTU5 itself never starts, and rz_mtu3_is_enabled() still reports MTU5
as running.

Look up the real offset in rz_mtu3_8bit_ch_reg_offs[].

No in-tree user starts or stops MTU5 today.

Fixes: 654c293e1687 ("mfd: Add Renesas RZ/G2L MTU3a core driver")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/mfd/rz-mtu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 7e1313a57abc..b7872ee0ba97 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -196,7 +196,7 @@ static u16 rz_mtu3_get_tstr_offset(struct rz_mtu3_channel *ch)
 		offset = RZ_MTU3_TSTRA;
 		break;
 	case RZ_MTU3_CHAN_5:
-		offset = RZ_MTU3_TSTR;
+		offset = rz_mtu3_8bit_ch_reg_offs[RZ_MTU3_CHAN_5][RZ_MTU3_TSTR];
 		break;
 	case RZ_MTU3_CHAN_6:
 	case RZ_MTU3_CHAN_7:

base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
-- 
2.25.1

