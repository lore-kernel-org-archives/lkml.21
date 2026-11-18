Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975250;
	b=1xZl6U4cG25WkHKnvB0T5jsGq4vy6OTijpi3R6ImOGwvzIaKY72T8JhzwYQirbmlFmrF
	 tVkRQkJFuyvQP/D8ahrd+Cppnrwf3EZL2nf8cEogjF5SlsJbRFQuXJTR1N2fXeWFuoV3m
	 pYPGqLe6fX4hwOTi8F48cEccAeaK6muXgVHM6xoqolnG7keY5p8JYk3WkUxd3b5mHaCCk
	 nJfnanlL+TAhQGgnNTHz5TZE7A/LyFexEieZtYWg7XAjSMQt3IrpB0LbDLWPQEwPxAl2k
	 1/U1wHtmzW8fFLQKVjq485YHBsfPqDBKlcLhvUuWe5rBX7ndc6HZI/OG0jW0dyPP5JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QqYVAbH+O5Ra0wuswn0xYA0NuJYo04JzgdWyvccojr8=;
	b=WSpZaNJmjVmjSL8VWyfiSsM3pf4YO4AM11SrGM6kCA98nG6ayAFPeudz4LxSpyDW4ft8
	 YgOCbwCNMglGlhStuSK7Z9PLynA5djOdD8cPuHChAZ7CY507l8NJBKIwdlRPVX+pDi67m
	 ki9T+vy5K+4KQjVEOOsNKCxKdexE57Jql1B73Lx8n62l/khz3AZ5VW4wSY98rzqu2gYXX
	 dpCt+NGZjxprs1HAouE7d3YuLdIQm6E/IBBF6p15gYhShNyoFgjiR5LosEyw/UPb+eV1c
	 sou+rim2PFM3CB70MkGpq5qNwT2r9sKyVeFWm/X9KWYQHVtkGCpoUnUFcrVU6aGEevw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvwgy8lj;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC0606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AC0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvwgy8lj
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9d7791b00so5102725ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975249; x=1795580049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqYVAbH+O5Ra0wuswn0xYA0NuJYo04JzgdWyvccojr8=;
        b=bvwgy8ljGMYFBI4Ygw0rFbgR0HHy3hEqTsLS9jrO4+33PKYhqXqnBsa55LGMTHZ5LN
         XJc/PVWeRn/u8qd0UHWg6NbTPsht7ffVqPBIK1JouIG0OdAj6zv5CfjvvwL9/tojCDl2
         wvHW54vXtCYf+c41J4YMeUKZCCC067IInN/vZ7L3gE65g2KXidx71QDuxZleeFjKcO+W
         pVu96oFSG1H04tTmve+dSWYLPw5CsTYNShc7BadfAfVkZ+3HbuDf+2JaJsMDup6VBKSf
         /mFSL3oXD/xvkyRvKHcJoFctXpXqyHlAz8DylwM0GIOHEjadcV4wplzCs6KJ1xn1zENy
         ZqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975249; x=1795580049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqYVAbH+O5Ra0wuswn0xYA0NuJYo04JzgdWyvccojr8=;
        b=LLbQHe5gpWyqj/me27SVGmi0BTYi8mVxqB67rTxk9PzQflajye434lW48PZzMQgiVG
         tY3d4d9wSEPMJ2n8IC1OIJkUkM40kfShEh1+Foo3SXcPjJn/mwLsvAHV9b6cslNJSYAC
         4HicVbzOsEmq892IwbxoVDDgZHazo4xX/FfjDCtKMJlKar2X4Y4/2zCnfKnVq5ukHQsu
         qePueZj/17ZNzY+mOXuJpftQkE1TF1oSJB+sAPLGMWh9p+b/YTazh+kv0C5x2xCRXWE6
         +Ukmrqk5q9/V/bSkwQFA4LcDPXoVsjnjsSga1yRS7MH6AIDLMmkysdAHFrwdFJbgGg4s
         GLnQ==
X-Forwarded-Encrypted: i=1; AL+hErG4O8O+R9e643JIBJ3qkPwhDBgV5CT3BqWDbbU2kLVuhAfZgf9DgCSzzR05it+DjvEEBufE2VKWYNY5aNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z83wJSAI8A7X9UhjH7wxWvp4Z7aQjdl5YMfnpspTag23whzK+Tc
	GaOH5szB1P0fgWP2JzucLFQiud59qB4OwjQ5D7peUvNLmT0TO9MRXY10
X-Gm-Gg: AZFdTZfchYpXM+EyzEqopTKizgYlxDazUl0jlZUeL+FNEpPDylFwJi/BY0Q6s/k3/Fq
	rU8UOFESlm43NCP9E1jmUU0WLES88TwIbJkn4Rj57Uw3/q0Fc6u+rBv+TNLckyanpnMbj/gv7Pz
	cx+uIuzdNMfqpApa5gXHpYdv+u76P8FDQ34X8WlXcBFPVFK/6mCsmnyittQmrIDXnWDa3neI/SG
	pv3LIz6pv5swoCgXN7REUKlBOacLI098e3y9wXryiCMGm0cCDd9fOnvbUntVIwigs39NVwMZ2Zq
	vZbR7/gCLu/GkCDy0NnSMI5ufR5VThSe37NX1AcudCnS88TrjHvW3A7clCsOsc9J2QbHPWVu/Tl
	NkxhMwhvereKHTTWcO2/tI0Wp91orgEfg8+LJfQwcT/mPXL5IRntq3tAvOf6lAUzHcICtjxqGGI
	B1ayZiULvHjlDblWNeoQCRtUHu1v5VhvhgJdlNImzpYCuAQSFee8+D0VmNPgmHg001ZfDsx78z8
	t5k0Zyp8H9lkIBnCqnP2DiJE8wplc9ebUovu6hvWNdqhV7va5kqmt9v8DDXYm29haubhxCF+024
	BBNnNFh3MfQg/9aEuCtLQA==
X-Received: by 2002:a17:902:c945:b0:2ed:56ee:af84 with SMTP id d9443c01a7336-2eff75693c0mr13558185ad.62.1794975248848;
        Tue, 17 Nov 2026 20:14:08 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:08 -0800 (PST)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	James Bottomley <James.Bottomley@suse.de>,
	Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH v2 3/8] scsi: target: reject a short SET TARGET PORT GROUPS list
Date: Wed, 18 Nov 2026 12:13:06 +0800
Message-Id: <20261118041311.19011-4-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118041311.19011-1-physicalmtea@gmail.com>
References: <20261118041311.19011-1-physicalmtea@gmail.com>
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

SET TARGET PORT GROUPS has a four-byte header followed by four-byte
descriptors. target_emulate_set_target_port_groups() accepts any list
at least four bytes long, then walks a descriptor whenever bytes remain.
A five-byte list can therefore make get_unaligned_be16() read past the
parameter data.

Reject lists whose lengths are not multiples of four before walking
them or changing port group state.

KASAN reports:

  BUG: KASAN: use-after-free in target_emulate_set_target_port_groups+0x1dc/0x540 [target_core_mod]
  Read of size 2

  target_emulate_set_target_port_groups
  __target_execute_cmd
  target_execute_cmd
  vhost_scsi_write_pending
  transport_generic_new_cmd

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_alua.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
index c110914b7b78b..22b4c39748704 100644
--- a/drivers/target/target_core_alua.c
+++ b/drivers/target/target_core_alua.c
@@ -298,9 +298,9 @@ target_emulate_set_target_port_groups(struct se_cmd *cmd)
 	int alua_access_state, primary = 0, valid_states;
 	u16 tg_pt_id, rtpi;
 
-	if (cmd->data_length < 4) {
-		pr_warn("SET TARGET PORT GROUPS parameter list length %u too"
-			" small\n", cmd->data_length);
+	if (cmd->data_length < 4 || (cmd->data_length & 3)) {
+		pr_warn("SET TARGET PORT GROUPS invalid list length %u\n",
+			cmd->data_length);
 		return TCM_INVALID_PARAMETER_LIST;
 	}
 
