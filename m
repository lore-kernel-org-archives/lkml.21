Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856818;
	b=pliqb8uENBJ7fF3d9ueYz08CQytWGMiGOgYuWV58EV66ouPrLLxK7OnJt1BrTLZbej+1
	 K1U65d0FgqqBw0dd7hVnv2dgIl2OgN6N8OZRb3MvrxUQrsIaEOlmCDi4lFjsxVZAb6vsz
	 4XCS1dZyO3tb+bmVCIsYkoTP4WZJXnF0aqC6J4ZELuIZzRiZ+i+dRfXx5juVaz+hTWFzf
	 nAkGmcTxB004fuHZ/12hEbsE1yKqd4U66ppNtBJN+1VCR2wEJDHjW3HMVO95/4wF9Ilho
	 ep60BVr3a7UBZFkWiY9nGyq5cMlRN1cN56nbRB7C14QdpgiTwexdnVhF9q427n1u1JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
	b=1Rzo0eguJSEnjTJ21mv8okUNEO8NAoWe7g9q8TqRYtZn7XCZT0D/UL6u7COfNGLBSlZJ
	 t1t83hO789oxonm0bBPHryTHUzzPvtyLEpNX6wp0jSAY21BZH44bduqqn7mIv8jrfbpvJ
	 lKZAwmCpQc08KIFkdS3583Hmizi4Q7zYCbM+1LTv1uDo42Kv6eXxSCjlcR1UG+c4REImg
	 Pku09gCUAYQdUShnmwkHA+SHVEpXLoZf34tadoz4CmHH+FGzf36QH3HVvRz1yDqEFgZ7H
	 +mDKyjndJXN+3i2scWOj3PlX7sHP+ym2ec5qe0q4noJE7dXh5JafsGYdATRnZDi6CFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4Z+hek;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D085606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D085606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh4Z+hek
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-571888655f1so2926597b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795856817; cv=none;
        d=google.com; s=arc-20260327;
        b=HfvzAeHYLvz+8ectL2i6nIAduOcww6PpqOY3427U2/6qfo4hM8RRaymD58iqlY5xQ1
         /yMBzxgM0yM2HHAvxDEl7WNvuMC5WcnlzZMeRsvZa3WFc1j34VlEPVaWv25I2TPW9cjb
         WKTPWmlY/Cu8Sq8BqTuwhHwAOxmRbDRfWI27ffK5Qpjv7a0Lgqnw/wl8qvQpARjkZpqf
         fiY51O+pm55+2WFS/0schOTVr+47ttBq8+9GFLafFVsf0WI+rDqoY6rpjtBD9hqIu2ex
         QY11aein8D8HMRbP5iyd+MaY5Kmf7Rc8UIU1iAS5+SfuKO+BQ2W5U9oYX+yTNOHHdp40
         9UvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
        fh=0pKQ/eaBi9/TxaBHkjcxPKNCUpPHZv9045CIABWXtio=;
        b=nRwKuLxq2hnIO9ew5GZ5pKhgJ0jvxs9gU2t6oSUSb+by8wHfW1//DQdtht3ek9WxxP
         qKy7W/MHNUPUpqQ/eqksmZBi+ciFXV75pws+0IdY4ZjLgWX005wyHXzEgeszwYTzmDpU
         aaTItgZOPzpjPb0pfMLq7kIsyj/67PeCnmQPDoIosnde5Xqdp4xtR6NLPdE9IbRLkNDu
         I3zgWGuCVzJtI1O28+hy8Ysb3KoIQHItbjyrFU9607bSzQHaEJzam4/+wQmHU0VSH6bX
         M0pw2vlLhS+JgB1VWFUHjNv+CVgFBQhicMndBKpf2ntMitjFzzToaGVedNSAEamfZb4g
         v4tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856817; x=1796461617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
        b=Xh4Z+heknMtsqxhaOWRk0CnR2/f2M5IDwDtGNDpFQnsnIasXTHCOgk3a/0nCsv4ryy
         NZflXtiSGt2N4Qm5s1fIMQZINfk+VcdfeSf6RYlClwjyKsTbjpDfoIPB+ZNQIenwslVn
         w5KqPpkmMy/RSMF8gPovUhePh9468dHP4BYfjFjBiVwvmMFXbKfiLlGoLH9u8UVKG0u3
         vIObSXhhjswuLK15a5uarTFz9K1fdajQ5bod93v45TSqGs5/tAMsd1yrH/hHekTSUekK
         Qt/xhfc7aUyUz19GXgyR2hcO4QIe66HwrRE4OFgdwVG+r4hJULfWKce7aiS10NbXsXiL
         hscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856817; x=1796461617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GhvD9qR0R60K880H7Ih9wqVyDuuKcSAunyNAQ+osYEA=;
        b=oOqe4TNZI64tPQrNj10CWe5xQgxNOMOQ2UJJ3LGKUkztJ9wqZF1TQ2yFr+2Mm5EbzX
         4cdfYRufIdgsyixmqSkhJoknd8A5g0BMNdP8vhewBBmM90fzWFRXvjpOkYQdnFubwYE2
         NjpBlVXk32JX6nTJRc2KH9MBqfjxseZ3wkA4Kb4Vvr6O7UzpXHIKmdNP5uQ30jOgj4ul
         +hJ46ZPloRYgFpOLDZ5s6+BNx5ZeX7qpFDmpjqFmqqX+Qsfx8z2EYT4rb0R6Zp5Z/tMs
         m5t1VDXaxB+DUTalMU1BK5NnXtmtsNYZVefyN/440znoAddj/aSt+jPPcLFKGrLYxo+v
         YoCA==
X-Forwarded-Encrypted: i=1; AL+hErHNxm543g1xn2jLxuyrE/q82Hgt/0/L9YXgWUPuLCOGhso7CnXSTUc0cX3KS7aDajYZ3UQpsKdpCiuyCfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fcoLxGM2Hqwrzh7pttpZrOfokgfkvgrZDPqR/L6cJohxTqM7D
	gLTyjVRFUUUaWwj7/7X8UOG9QPtsUfatMHhrTHnJmlLkCrXSvuHDJs8ry0zNL4Iou+60kLLBWwC
	DbkN5GaPwmNyuWh2YGHtjA+kHJxKBSBs=
X-Gm-Gg: AZFdTZdG6YC5NZsDGya4VAsgLf804EqvcR16cn5b+LIS6f/ZtYB+oNsGfaRh3XgtkNw
	t1wkj0B4eZLLlyO5G+5bRegcG5oyymLWrbiJFI+8HM60TiJStRJMQfZkzkWuwix9QE3NNsktanT
	C88Jp0iV8h0wLZhktfpP2QEVR1rqaU4VkKP8678e7QUfNQN99ZD+G7+aXjNETRXt3T74OqEtOYV
	nPUxzuG0QiF4eCD2GbUpkRzBX6z2eu02uuYcQg6EnJsXC2e7DrgOFtL8NG5OspSUUh+UpoD1RFN
	1egGTpnlvEksitPztQu8b8TQkL0b0tMRXIJ7hlFyWe+VxoRP8ugU3tmTku3ILns1ykNee2IQifk
	hdGNUuf9zwZpZ3kjeU7iI28jM7XuOv4VZecERG3hd4AuJinEmZvt2J8iRjRcOtnNJ0Q==
X-Received: by 2002:a05:6809:8c:20b0:57e:644f:7dc0 with SMTP id
 5614622812f47-57e644f7e23mr7101887b6e.53.1795856817064; Sat, 28 Nov 2026
 01:06:57 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 28 Nov 2026 04:06:56 -0500
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
Date: Sat, 28 Nov 2026 04:06:56 -0500
X-Gm-Features: Aa3M54p161hdYLu_o80LkaY4fJESt148cuRdHuYF5j6V7LAF57510-9zgzImjW4
Message-ID: <CA+m4KrCviR01-RnsX2RkaCUr_iXHbQjObtdiUmRfZm8ooOGWYg@mail.gmail.com>
Subject: [PATCH v2 1/2] platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
To: mitltlatltl@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

gaokun_ec_request() issues a write followed by a read. If
i2c_transfer() completes zero messages, the helper logs a transfer
error but returns zero to its caller. If it completes just the write,
the helper returns one without having received a firmware status byte.

Return -EIO for a non-negative short count. Preserve the adapter's
negative errno, the EC status on a complete transfer, and the delay
before releasing the transaction lock.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index ac21f732d..abf05e7ec 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -145,6 +145,8 @@ static int gaokun_ec_request(struct gaokun_ec *ec,
const u8 *req,
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret != ARRAY_SIZE(msgs)) {
 		dev_err(&client->dev, "I2C transfer error %d\n", ret);
+		if (ret >= 0)
+			ret = -EIO;
 		goto out_after_break;
 	}

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
