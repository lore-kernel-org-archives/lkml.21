Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153327;
	b=yn+dJb1KpMvotaxvEm7fGiQJtsx4B2g/Ousu4eJc1/KA/ud+xB1A32Gq8eW8o95mWf4O
	 hyowRS1RDgl2n5/8ockmlMLnrQxGawlfKWE6X/Fw3Ka7R6LaysSbr4D5OfiNLjqhjImaR
	 Lx4GiYFTefzjrYlqcVHjX9jkxNtLvERXG45zOGWoIIIN92U2e5CKwVgUsWQwUmlpxezjt
	 zLJkZtBQ3jCWPNw529YDElVklq4SVNZ39XZQRw+qIezBNyF7s4jd8mogtXYJMNFDe1Cgu
	 msRtukuCfKwt8MdYijJXknQxa6AdenSi/DK/hoCGyAkL+zRpiLz4MfENN4ftZrXgqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qg66As88L7D+ejFnkRW364NrY+XWuQ72Fp7ONjEgBVs=;
	b=t6fPxk0Wpwrr+I+VvQro860PR5YPfGZABmA5/yV9mGlpyS0fun6eTKXeFSm/ywGFVfIX
	 VFYY1/51EVfNP9nPwrladfKwrEfvJwapHWgqWPWKkQjAMJS3TYoMA93eRJ5ncoQpSQGp2
	 JEqSbym1rkWgEt+BI5wxQw8GndiSm8gaeIZWofx6P4W5lTbHXo+176Q09XmmyscxIB7+V
	 X1WC27EwwY35ZTJ9J5Y09Y28YIYsLjnOjW9BDQznuGOt7QQYlv2wk/GXEXtHK/JrIMOhb
	 b+Z+WIvyRIrqzrK+1SCeXV3x5fheG6A0j5CWL3/pqhIeFc72+C0sT21ZOaLca+xkCIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObKmv8K6;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA1606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34BA1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObKmv8K6
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso524482c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153326; x=1795758126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qg66As88L7D+ejFnkRW364NrY+XWuQ72Fp7ONjEgBVs=;
        b=ObKmv8K6gmkJWtEjdBAWb7j3COSE/CtSWyImikDHfSRx6vXrDTPFVmbUCL/gGX4vEB
         As0xISIpu88Wguo+NW3O37lxEtFNFUrHCOxgHv+Eix7dvEHbkkns3BAExvgyae7eRlyS
         UW7t0igdOI9Yr6m7KRryj21LejRBhU3re+etHV16nXBm5q8rTzDjsO0Ko7jAbuB4sgrK
         d8lU11s+qVEtIs9BJBOBsdRBIgeaDvR41kKufznc8bEbXBbiWR/cq9E+zSHJdSlY8An5
         p4sgYh87KugFa59YHNXeUsf03VlBZGxmeKY+yPda97a103nL5ZJBAv4ZaG8mZyTQeWMm
         70QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153326; x=1795758126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qg66As88L7D+ejFnkRW364NrY+XWuQ72Fp7ONjEgBVs=;
        b=ZGsBxVVDIyYNQ7hEIQcx4yvQQ1hlw2bAX0mmkWjhK04ZkD3vn8zC7zLKBVwOpMTpZH
         fFdt/v0PCZK38h61srMGEg1d47zYyGqj5ArbAB7J2x3udTtvFZVMXywqBC/hZicWc77Z
         lyVH4QsMNo4EQiFwAw43dwbaqdFrOfMbXggGB42B+g5KBF8Ruwye/cgkKuMg+QUMj+Mc
         YFtYR1lP3g3H7OX4dbJUBuxXlfwILJIKNtrRv0K33yihnVub08KOtJwHdEM8Ba+Zdela
         IFEaCpaJkcSKgCk3+Q4igV+5XYoSixzuA8OY8c1S6yqZ9GZbjGu+TtOIDwabRQslS3Vi
         +BJg==
X-Forwarded-Encrypted: i=1; AL+hErG5kwKRE4VGLVNKlIDeIbB8GolOO6s+m0Ja6MowL5ouuvJZ7Wq3esAOoBp46LHPlJX8/S9Teby5yoLfqbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OngU85qvmdToSoMwdi8ERzCduuFL0/PGpfaT/E+hGjZ4GI6eh
	eHQeEc/pDpsc+VKBXFmJiw++t/SxS9sATnlER+81eZyeNO0to4CvOLYu
X-Gm-Gg: AYBFou0mL7MtlW71zYek4epS9iShodvUNu4qmztcGry26pLOMSTU9fwlbzHo4eU8hJb
	v5DsDdjFXx/eNCCyVjCzSyzB/JAupdtx9c0LzxVd7FyHU0UxN+pybgVdQefWW4I4xW23cKvMoVq
	UG7itBWePVN+1Cvi/M+EcP8Tg+lSmlMPhYipHhNHDd8UOQA6uZloQnmX7Kje+DIKvKDCdKUlNQu
	4DdrWksNA8AN+P+7s0a6mudDHQfNiG1SiIyfS0wz1wbdythiKrofJVpdfok/pG9/W/IVx+XYvuq
	hBI2j6nmBmcaAi0twUGgG509gKBEyHdVc7YQGbjh/fLF9n1kW/b9lsTjq9+5i7cuZvNlt/5YQxG
	1rnz3Hqgu4wu2Dv80R4QmO1dhXRNq0VVdSHGsPFSrPJhPHzduWSDeVyMhtXIQcKQNcTfxbLyT/P
	Em90sa4tHaLHEYuWBnD7HSFxjmgZhRoltEVdUK7YYk2vCCRjG4Lcy4VKhGRDlmHLQUHjgqu/7X+
	7nak7MmJXxhrw0N4oicOhOrlxjCEjis4V8ILDVuXICoH1oELVGQcrNFCmERNixf02OwtsFRF/rh
	HMbG8uRbnfEGkfZvrPV1Ll32DGjr
X-Received: by 2002:a05:701b:4510:20b0:1b5:595f:4236 with SMTP id a92af1059eb24-1b5595f4800mr728992c88.35.1795153325979;
        Thu, 19 Nov 2026 21:42:05 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:2c81:3ed2:5653:bdbd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm3807956c88.8.2026.11.19.21.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:42:05 -0800 (PST)
From: mdshahid03@gmail.com
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] i2c: scmi: fix memory leak on invalid block length
Date: Fri, 20 Nov 2026 11:11:38 +0530
Message-ID: <20261120054138.194076-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

When the returned block length is invalid,the function returns
-EPROTO directly without freeing the ACPI response buffer.

Use goto out instead, so the allocated buffer is freed before
returning the error.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 37442c9ee222..b65771d31a28 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -248,8 +248,10 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 			result = -EIO;
 			goto out;
 		}
-		if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
-			return -EPROTO;
+		if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
+			result = -EPROTO;
+			goto out;
+		}
 		data->block[0] = len;
 		memcpy(data->block + 1, obj->buffer.pointer, len);
 		break;
-- 
2.43.0

