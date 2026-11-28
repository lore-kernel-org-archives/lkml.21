Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834039;
	b=s9QisSXrH6VmD1vjat/SkYcv2+wEv8ILPq7roP3AyVOyn9dxNsim5P08y8LVdnhgBRle
	 Ww5Fcfa3gYwVm1ZqyHdhYuYy6j2fidzv54RoZE9SGjk4ehuMMA0FNwYDjwj3asHA2YGfX
	 SjVR4qHiN1l4gyzdtr+EilUTHG2odYyilM3dRkscwkKXBYgRv/p2MfPc7gIY9LZRoQ3T5
	 iV2sJzH6GyoadonMExNXBFFUkyF0GnPkMNCmbWD27Ubr7/3mQagpNQQKcoMh8csN4Qf5T
	 mWFkk1cD1Lwl5PjSVb9Klt3FTFKGGrf1Xp+b6QXLk9t2o3+RlLGXqnw9ukoPakTqiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=9T+HdmC6Yapk1iAmngRWLiL6+qpvVAULPjY+mcoJnZk=;
	b=jC3StFIfAwT5dLKx/6FSsJ5Ikb4ciTkfoU5wzDF1Ce8tc114KC2rLRrsn8/PkKhxjwKG
	 9tpmckuzNb6GadgIYh+w4pxqwHHTvIJOHV/Qr7nfdveqjjoDmEa4CgcJumT5Xh39Jn58M
	 bs/Y1973sbc1VRPnmVeZblMs7JR8yjafVA0vlz+hexhLf3DW6tCiOOx3+VF6bDV5g9ZEA
	 YGf3dNf5LZ9kym3qpSNDcGs0KK5p+p2rLVo89ZBUL1V1ersn6evlsQzWxTdccgGRkZFQs
	 mS87HruL49dq30XgeaWRB0+G9AalDtqT/ZwJ92e3ycAP0OCKbNmJAa+vTBLtI+mPX+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b="pi/9tMDz";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E4606A329
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 265E4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=pi/9tMDz
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386ab9ab619so12193354eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795834038; x=1796438838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T+HdmC6Yapk1iAmngRWLiL6+qpvVAULPjY+mcoJnZk=;
        b=pi/9tMDznb1a2G0E5fG4M6K4VKw9WxwcQlUk/AFTQmWkc06yYSLnn3wxS7EnVqDZgD
         S2FHbi/Gul7MCq9a1AsBJsvC2/vW1+hCog60VfabTHM7VHuiPhoO8hjr2PfD2IBv+Op0
         SG/5zx4sm8+TuiRU2y+Lnfi2/RMWN3RyGwEJQNgZe06gV4kNVpxcNlpyiNhnp3gEoTYv
         vxxwS0WYwN6nlPrMxQLZnslg2xZH53YM2zmO2L5UDJfI9iPV8o3ENRqveWFVShmkv6zJ
         Zw7Sj37OiGhEJxuoRY2PxcLX6wmRya6LsMCN0sWGVUehkcpVIx6gSDdx1s74soDIMtOU
         zmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834038; x=1796438838;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9T+HdmC6Yapk1iAmngRWLiL6+qpvVAULPjY+mcoJnZk=;
        b=aAy6BYvLOyj137COPA7+gaYFYlyr/ydTfjGQOS3q4Q6vMnchQYuwHhfvmjpkKDJ4ax
         pRuoCXv26K2FTR95C/7eRjLUsbvWMISgbYMjQvLPdc9j0bSJBt8pEZLpPJkI1mdYbO2Y
         Zl38K8OJPd2vDVYhzCFMnMXnK1FWWm/b46sj2ZEfMAdoG2+p2yOskdbE/LG2zDL8IDRz
         eKvMjaRMc987DPJKsS6NEuCSHViHr/YahFpOrAY6hHKLv+ahT2zIe54Vx3eiwqcd8QPs
         m7jEaA1h5t1j86syQtzpwaTxfGbE43fxQxpvgITr3bw6z1ZBqAA+f1NGPcv0MqZkGhuN
         Z1fQ==
X-Forwarded-Encrypted: i=1; AL+hErHT4dNYIKS7YXxQUd2cyo1iuZJcsS0EgDFCR49GSG/byAxL2pNiAlu/U8Q1jmW/+84nS0U7/ZRTqKl8g0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aaebfPCSPaMJWJJquGxCOfOIxqOKxgFA/swleSoDLSQYYZjGM
	fxJ/ZolCEfqPBDPO617Z6S7K4+JoNu9RLEbK55eCnh8NnbzFnQ63UrUxhF3Uhx0cb3U=
X-Gm-Gg: AZFdTZelDoRMn9QQCld6BvoCV0e/q3gYgzsLH+CrA0B1XWeclrrzutcQxnM9v9keN5U
	pU52YtjCplk8017aACDfL1ePrAhbrNRmu0XDd/DZYBXrviO6n6iCZPQHDhHD1ACbHWHjrxnVAQH
	hMLRgTXzh6YyiaPlo8zz3zBZP0M0JTz0QC5yWbmZah5qvsd0V6R/fw1Z12wQjZgqfJoZfk+D0Zj
	FmwqWbVvQ5x0U+70lCnoDoYQ/iItwgEaXrjMcFzE9fMVShYWwYX+CdtcWMxoI22ZNDWZyj6SmNB
	P4rfZA30awmmFORy5b1RICG7VJINydVFNRC0wNgIg0nnE6gIAv+o66VXbEVkYX1OG0cCnDraDw2
	FFz7JbakhzLwkmChvQZuXLORX2Ge8hRUWF8xj4BW98p7w5LwTzznwo9pfJ8VkqneiTg79MABhQY
	25w/S8U+M2tUrCtXrXkERAuocT1BHkAJNqHJHkhaRwt68JEzUBF3biy0qFJnWvaei3aHE0MAjW8
	xw+CEvXP9QxC4E7h87suZVY/juz0QHf9NLrmZkVsj5Vhh0d/8VYeuOPUNKC6z1yEfsxX55t/kId
	eKD4uENHjOaZKbwKF/8lAiOJyxtEoHrlc4sx3ShSaCuYuHxt2I+wrqwfc39SGwspZG774xoDwnl
	zkckUgRGIKOXgYt8ayYuIx+SKUoHmI/i+y9QZregq84zNWnFo
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr31707810eec.35.1795834038348;
        Fri, 27 Nov 2026 18:47:18 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm134059672eec.3.2026.11.27.18.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:47:17 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Uday Shankar <ushankar@purestorage.com>, Shuah Khan <shuah@kernel.org>, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261126231706.1303486-1-sashal@kernel.org>
References: <20261126231706.1303486-1-sashal@kernel.org>
Subject: Re: [PATCH v2] selftests/ublk: use the configured kernel UAPI
 headers
Message-Id: <179583403747.86956.3400056102579303630.b4-ty@b4>
Date: Fri, 27 Nov 2026 19:47:17 -0700
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
X-Mailer: b4 0.15.2


On Thu, 26 Nov 2026 18:17:06 -0500, Sasha Levin wrote:
> With generated headers in an output directory, the hardcoded source-tree
> include path falls through to distribution headers. New ublk flags and
> structure members, including UBLK_F_IO_DESC_SIZE, are then missing.
> 
> Use KHDR_INCLUDES to consume the headers from the kernel under test, and
> add the headers target as an order-only prerequisite of the ublk
> programs, as nolibc-test does, so that a standalone build installs them
> first. Baseline builds fail on the missing definitions; GCC 14 and Clang
> 21 builds succeed with the output-directory headers and target liburing
> development files available.
> 
> [...]

Applied, thanks!

[1/1] selftests/ublk: use the configured kernel UAPI headers
      commit: d9667b1a6a3387ef934667b9a2e6c099eee0e4f1

Best regards,
-- 
Jens Axboe



