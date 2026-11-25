Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632403;
	b=pHYD5D8Tg1WjcneN48dHpc0tNfCDXw60YWVfTXbx1dYWN6sYigL7IMJ/qXpXgt/VmZpD
	 yS2CFF7TOTHVRl1UxCzPTWeiZHyxlQfIonUd3YU04wVCtmlK1EShVlYnkCrcnNMymonoI
	 5R/B0hObT1SzPqYIJzmyCfsCPi6wiysHN6GFFSWC0SYoan6oR/vyBhke2QsqGxQSVuXOX
	 5Ez4LAzbQ5CNBKTo06BJxMQEv2MNiOdKWunKsHfA2fIFBeUvO24VSNduft3gPNPqrOM02
	 PPZjQmLSbqTid2aOc4qjazdk5iwXwnhODNw6JPi3Bh4vUmUvORqu8MBjrerJU+EPpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mjng7Grfi+u3FVsnhecehgfZVWYTQAiCxYEYWdDHAjg=;
	b=0ieYXWDDzj5OJT8pdAHVwfYrwMHiIBItfDps/nCcx6eGZlN4rSkmSgUwxzuSuNlayGnM
	 3z9CaVKyreoToq+I0gfbGVxL+braV6qTevcZpkF9BM38iwUtRqwYqwZVjHqTseSsJcALm
	 XB6UEMa/xxbjO564BRWUdTVSTG6OvBt2yB6BVDMtNuKcrLOBcjEfppxbuMYB7cBHAfT5x
	 MX6UOFayj0IVMH9UuamiJ3opWWWxQXhnkzGy/0s+UCBmFnTxlvVdMtwMjQ78GO6gxRE+a
	 z4aZEqr5teV7+bkxNboz8Ok1ws9VX7Ry0loUVbJxOBekxSo9rqazF9j2Bnwx7mfjEbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=FCVWvL3A;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591F4606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=FCVWvL3A
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed188ee81so3382196fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632402; x=1796237202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjng7Grfi+u3FVsnhecehgfZVWYTQAiCxYEYWdDHAjg=;
        b=FCVWvL3A9pPajRsorw5xKgFeZtg8bNqB9d5z48BRmkv/RN0ksV7mW8feJ1FdHXkX7D
         M5MhCMa6fP8Jo/YZIxdt3QdFhae3xdx70I2xdYN3OcrY7j8Vex1PQlRxc5WuFNxckaRY
         sgJQGpIJ6gc3jCCPLiRW70LNGrZW2+wfGQb4P+Gh0kXnCng4AP9SSLgQlCk5CdpJ+6Mg
         9ZeyYGwMPMtfJy7L3vA7kf2Lh/3D+XQXq5YvwgfaCXThcgJSor1qc8v4bVjNJq/CugrF
         1gIA5oqKYDMc3d2PPtJvFVXJPWM9FFpPZEHjxawHbALUzFf4qVIWEEWsI1OLfhH8kg+s
         lzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632402; x=1796237202;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjng7Grfi+u3FVsnhecehgfZVWYTQAiCxYEYWdDHAjg=;
        b=KhANpS19gp0doORtjnVxlin46t0CgQABDpamTPYGnid7szCFSMlO0lLP9FFzzz6Lik
         2zMbzsk8C/kZ6RSIainnksgpsRUvSslaPVAA+pulLCpYFetrrK9lmJtp3PnYDyWh1lKh
         XXh1JyYnAWAdYvZnrQ/OmaC6yyflxlBWTF7aQvH/GgSa0NlS8hk7Q8uJyMpxr/XC/jzu
         wLeE9k+s+Ge05oMov3YrvBekLqPK4F7tRZvfXZd6vHUw+I+ON+0FCTR+u+bDt2X30phx
         3WlKlO7ZAGOoxpf0cHqok/uUrUgY1jjIlCyb85HBl6YmPID8p2ooIywsuG6sawy1WuIn
         cLVw==
X-Forwarded-Encrypted: i=1; AL+hErHs4vnT8HBUg+4HpqT0CBeHe4OzW54RGrm7zXCPrUZ3PyCppDTfKqOEGS2X7HvuXUC5MopVrDDwXIYdv5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TItnLu7/mWZUz48GtWf1alyi9n18jdnuGm3UXef16wZcpQXWD
	g7zWUYEG79op0c2TyggvNPKOTe7na6T9bDlgDcozWyiRRmnNNynHG1YdjMLbep154/KA6LR3ubF
	46ntvLw0=
X-Gm-Gg: AZFdTZcWK/BtMLwuByIPh9wT9eezyfHZf8fb5w+//lRKS1yEbjbR6WhYAhl2Yqt8VXa
	2pwopMGDvxfDGkd4OoODIl8+4ougQEASsuUpB7oUm6xvSK5HFY70YV2lNrrgXjO7NvKygEMQOgC
	qSwcXnNz6O67p8hljimu2FJ1g4DIt6sAW8NrY4WiLbe44NMEPmLBTsTf4S7af8GEu4PE3xAFo6H
	q+v4xgUhV9oyaRluLYVMTh1o9lZtBuCpxlYX5X9QiypeYkjbJDS/pWwtAc3hkC8UKvVbFGMc12d
	jfhza4+oPQ/50+mUgI5cTAMB9vb+AXHPsn3ZcF8omAP4FaTlm9543JcflHfvuxxWETGMHGA19SP
	U3v57jcMYY5PQ4Oq8LH9p1AeIQDhLsKRYubICMiCfIEA4m2oGHgLbt9zU6vy2J6zc/zCeXbqp1Z
	4CpXpM0FakHZmcGMT/SJTDfjWx2eGYNqCBVnKxqA53bKu89+U67n+yGqdaa3eh34/XcGgvKBM4T
	TOPNUooQFiFdOOM/5XemKXLpcigkItgH+oy97iiBYKnNSgjHz7ho4c3ara8AQZZ63JkWYoofxDz
	Bo43JtEJDxd0nYYBLVVb6sPREtvYpHEaLOf+mLN00xqWe8vt0vfDW5FBA6D9ganx8XHumVfaL30
	+rsGgT8kyy9A7ULDCPdab0j6D8JXOIIz8qAr9sfwB+0LGBa0=
X-Received: by 2002:a05:6870:9f06:b0:447:a816:9328 with SMTP id 586e51a60fabf-4bc7d27004dmr15233245fac.6.1795632402212;
        Wed, 25 Nov 2026 10:46:42 -0800 (PST)
Received: from [192.168.0.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdbb4fsm16100211fac.5.2026.11.25.10.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:46:41 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, 
 Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, 
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261125180817.3682397-1-hengyul@cs.unc.edu>
References: <20261125180817.3682397-1-hengyul@cs.unc.edu>
Subject: Re: [PATCH] io_uring/openclose: allow an empty path with
 O_EMPTYPATH
Message-Id: <179563239982.59738.3885070855102608736.b4-ty@b4>
Date: Wed, 25 Nov 2026 11:46:39 -0700
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


On Wed, 25 Nov 2026 13:08:17 -0500, Hengyu Liang wrote:
> Commit 31cf44efa6df ("vfs: add O_EMPTYPATH to openat(2)/openat2(2)")
> made build_open_flags() accept O_EMPTYPATH and turn it into
> LOOKUP_EMPTY, so that openat(fd, "", O_EMPTYPATH) reopens the file
> behind fd.
> 
> However, io_uring also uses build_open_flags(), but __io_openat_prep()
> still copies the name with delayed_getname(), which rejects an empty
> name with -ENOENT. As of now, IORING_OP_OPENAT and IORING_OP_OPENAT2
> accept O_EMPTYPATH, but fail on the empty path this flag is meant for.
> 
> [...]

Applied, thanks!

[1/1] io_uring/openclose: allow an empty path with O_EMPTYPATH
      commit: 15ca993634424898cc0c055ef84dfbe29ae0370c

Best regards,
-- 
Jens Axboe



