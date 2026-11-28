Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856818;
	b=UJ7lKCx80G26ha0lIt2xQSn/mywyuMZP7DiIohvliV8S2jma863b+CsluqH1pPp2ysV/
	 L21p6Vp4r1yrKbKWthhgURP+dCEBujDykTUA8IOmf+8vZXko7WvNcRgSIpPaHvyP0yCE7
	 COlgbQmbbICIIpSILfOCAwIAScfozObADDSufAZ1dRLIRX0XBkbtGARnjfTS66cpFdf0z
	 /8hdqswIXdWU/sw75NbAI/6G0M0dqlqiiMqDpZ8U6QZXKB+9toBjqeMiVCQO4m8PaD+tD
	 PtZ0CHHuBfbq0snVIo4wSKAkcLdvLCUzkwK4pzyx0Ktql+nAVwagbAp2vIBDTFvTmsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
	b=wLXmNIXhFo3UFX5sFJUjYdseTcGI/O68P/0cRUdQRQY0mTgAZ3fCCs2zIRk0Wu+HSKmd
	 RPPXFYzh1s2czp7B7qQvBabRcbDRpbCsPW9YEiuPU2g3DgT8E4ejY/MyKXg7HFuLnzz49
	 GopHybHClquuVyVVQk3l1Cjx3OlE1bJ+izpjKkR3Sdosn1jLdS+UZF5liCvOuRH60yRmI
	 Welj/sfs0Co2ialxPPkJco7sluEEaMjVEGtsHtqre6XMlfExYNmwdvPwlp1ZbfJ/h2pgM
	 tkHRXj/h/bCeoDdEUgakapeHqvz6KIM7nNez4bAFoS0kg6QlGxvy0DWrlRPBa0e1Mkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kY2TjtuE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDC606A326
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kY2TjtuE
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71ae5389c00so5504161eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795856817; cv=none;
        d=google.com; s=arc-20260327;
        b=VIAU2Dk2G5Vp9wSiHlXuotp0FuQ7I/r5XN2tr1bqr9LeawwY7MToDsdKjR6N5yE+Zw
         u7zIHzvtRudT086lls/6w5sxd29rTBpR46aSXazsxcfZcC/QH47xbUq9KcH9FA6uAFSt
         lwkzTzJo649WXQoHj+IqsgfX1xrH1eyZIXPhoTz9Av8akpy5fWnWyPZ5x1Aeq5khWwHi
         DTmLGFrglzam4HzPvFBRvmU6anAQxcJagJ/VnrPQgPdPJEJHXWUknGX0/hcHYNKmAHht
         GFermlH7SoJSlm1WZ78pNoFc2JxregiOkwRvwAV/v5tGpMuS5MDv8Upvje+Hnnki7zrQ
         mMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
        fh=6nlAglBOcUj/xGmX1EYmRE5ZmTAE5jwVBIqeHg2qKn8=;
        b=r1kInKOwNU86z92ZOXXL6LlFRArY1cuM8YND1Aogps/1CyvLJzGaja8lQWZB67p8rE
         1kE34j6ixOOQHugukyZN0SJyMCA8Kqk+5cwwRwEHKbL3MRbS+uapt7vGzKQGiMUqY0Ze
         ufix4ouiExNJSDfIWY7dzXBcv4Mt02b3Tdp4M8vjWs1CCRe1+qzRX0heq4nGWVZ7zO2L
         3iPG/PI6iacw0a/hu3/wcIsyl5x4Hx0yUrSOC48FYA3N7YJiJDLd8eM+76D0x/9gHia/
         /lB5OkHX0ff2BN3Nyg9bfDev9TnpXvH95cxtWrINJUKIveXM8soF9a4zR7Qx+qzceBfT
         im0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856817; x=1796461617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
        b=kY2TjtuEqvQxp7S16LVnFjkKt0amS7WrgIC3tSG8+bj57MuWbzfAo5kcj6Zpbp9dyA
         yUBxNMPN9UYF3frksTlfpCXxH/GMUghEcRNPFrrokD3mIWu+B3E9ANu7SwvCCc/mSFqU
         SbBSXfGJNLq+eHSZRhVCZ1/JzSY7cjr4zJmmiLD2GFWbSGBD14YJak+g7FtTjsx4e4vg
         QO/3TvfA5T/agkVRCb02+N9F+sGWno5OwpfNB2vzA5RAtLtgRJ/mr7rZ6wodO3cV/vhA
         n3HYkpDpPiW4FdyWKIJdHOYd1NFzd1Cjnpju7Mc6ZfPbttZSIqdK2aqeg/gEiCIUkJLy
         aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856817; x=1796461617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3KZMhHVudSgH6FvoJlpFx5uX5FvI2hkrvPQY8rUrZ5g=;
        b=y0N0GWeE7y0xByH5kdn+Tw0fy1lHYujhzPfcSONhY/9npMrOIPfBcrxElk/tXmylnC
         fWUmZ74umulrcTQI2FElbsSKGelJ/lUFkQxNGUrswF5QSK0rP0QZcothVvZh34YjJIcc
         g7SOvdWJXZFV7mqo7iYSF+d/AXv9ZmV68MiO3eAv7m5gf9Mtc6hFrYvivzdLK6Q/ZO3w
         Vz5+FPBguI+3bxZOZYYnJjTyfqCY8jVXNNOeOsZjNoDO8ZXSrYbmm2zOBTIM4hhXFyi5
         he3uRUacgMtR5LBhYH6HmGEfxRjfF9+kz31yF5R9QU6DWfEnomLWdvWhuGAnebxGJEFG
         LRDg==
X-Forwarded-Encrypted: i=1; AL+hErGgtrNt7lZKQLNYFCdsFLrgApDd5QHLGfEjn+d69nC90UhYKK1KakzxPbCLlqY1JB8wl8vIyw7vGHJ6W5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CO3NteUbyWEIxbVc+tZqdUPuekePZSGesu0l+2KIq9M2UNeEW
	6qhx/GtikFE9tz0hWs0q1unne+BbjiVO3eTsKW2Ki6ChzCMdZ6uhTWI/9x6iVHu/uFdyZHrZ6S/
	vjy4z4JzPAj6EFybtjPjt0raD9OOw5uLmUHME
X-Gm-Gg: AZFdTZeIMfzrcj9etYioZ3t4DFKeVB6C1HtXyL6Ro0JyVV+A+qOE+uTHHBmM2QYafaJ
	Vo11VyZhDU4akQ3STz6pNEFoIsiNAhtVgRGjHWKdiQPLPN1+dZK0ANgiSMzpiyNQwEejJzvmJT1
	80NAho6juUJsOgLkUqe4M+H9p5adSxumOxvUyca/BJ3gIRAgtOqZ+/7IgY0phdmoGBDkTa2JVt1
	g5xiIxQiEgawuvwgz7O30uLik4TUNmwWBHtRxvZFWSmcth2DW1aey5p9XV5UrhLgwr/zcAI8yt3
	H2AoMLzICSXXJYg8Hs/KVxy0w6SuIrxqGspPMNnDW4v6Of/4X+2YMHU3Wh7JFiMvdii53jMZmIh
	OAjdvFnhWf8fbbPFMUFKJfOumykadlq43wjJ81SZi5aAfoNi9eY2BsPgyyGky3nZfXg==
X-Received: by 2002:a05:6820:5701:10b0:71a:e0e8:bbeb with SMTP id
 006d021491bc7-71b395bbda3mr14331243eaf.88.1795856817530; Sat, 28 Nov 2026
 01:06:57 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 28 Nov 2026 04:06:57 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CA+m4KrDv0-69kXyM-q3kK1O3dnbadWwDH=s+yH_7uEvVJsj2ow@mail.gmail.com>
References: <CA+m4KrDv0-69kXyM-q3kK1O3dnbadWwDH=s+yH_7uEvVJsj2ow@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Sat, 28 Nov 2026 04:06:57 -0500
X-Gm-Features: Aa3M54qz3n1PjEY6edKCZOuxdJo2YZfh4h2Ta0eDxxyIHMwc9NfnZ3LIjDvpUJ8
Message-ID: <CA+m4KrC4-oEkg2_+_B=kn5ObqAd1ZB+f+hpe53Cmqx47LHnGDQ@mail.gmail.com>
Subject: [PATCH v2 2/2] platform: arm64: huawei-gaokun-ec: Validate the PAN
 ACK bit index
To: mitltlatltl@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The UCSI driver passes GAOKUN_UCSI_NO_PORT_UPDATE (-1) when the EC
reports no port update. gaokun_ec_ucsi_pan_ack() shifts by port_id
before checking the sentinel, so this normal path evaluates a negative
shift even though it subsequently sends a zero mask.

Initialize the one-byte mask to zero. For an actual port, accept only
indices 0 and 1, corresponding to the two connectors on the MateBook
E Go. This preserves the empty ACK and rejects invalid port indices
before contacting the EC.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Link: https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.org
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index abf05e7ec..bfcf7563e 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -56,6 +56,7 @@ enum gaokun_ec_ucsi_cmd {
 	UCSI_DATA_READ,
 };

+#define GAOKUN_UCSI_NUM_PORTS	2
 #define UCSI_REG_SIZE		7

 /*
@@ -458,10 +459,13 @@ EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
 int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
 {
 	u8 ec_req[] = MKREQ(0x03, UCSI_REG_WRITE, 1);
-	u8 data = 1 << port_id;
+	u8 data = 0;

-	if (port_id == GAOKUN_UCSI_NO_PORT_UPDATE)
-		data = 0;
+	if (port_id != GAOKUN_UCSI_NO_PORT_UPDATE) {
+		if (port_id < 0 || port_id >= GAOKUN_UCSI_NUM_PORTS)
+			return -EINVAL;
+		data = BIT(port_id);
+	}

 	refill_req_byte(ec_req, &data);

-- 
2.53.0



On Sat, 28 Nov 2026 04:06:44 -0500, YoungJoon Lee <getfeus@gmail.com> wrote:
> These two fixes address short I2C transfers and PAN ACK mask
> construction in the Huawei MateBook E Go EC driver.
>
> Changes in v2:
> - Patch 1 is unchanged.
> - Patch 2 validates against the two physical connectors, as suggested
>   by Pengyu Luo. The no-port-update sentinel still sends a zero mask.
>
> An I2C stub and UBSan verified the empty ACK, both valid masks,
> rejection of invalid indices without an I2C transfer, and short
> transfer handling. The series builds as an arm64 Image and EC module.
>
> OpenAI Codex assisted with source inspection, regression testing and
> drafting.
>
> Lee Youngjoon (2):
>   platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
>   platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index
>
>  drivers/platform/arm64/huawei-gaokun-ec.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
>
> base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
> --
> 2.53.0
