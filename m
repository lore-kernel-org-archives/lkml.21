Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648894;
	b=spmkkxkpnBqwjs6RhLfYsaq/kqWyG0s202sQtLoVhq0ajNmvMEEo+sjw/mt6lowLmlfu
	 GAF33gmJ/wggVHjlzBzquAXuDgvNu7lPWryY+N2A8RWkt0TPvsG6wZBxLXih9oOtHu4Qv
	 p1MJ8EoZOwWOt4/UJ7/SJNWe1KVfTn6/Nu+9VUp3ATfp/zyX4a2LIMJoyXj6c3NDfmaPg
	 13c/wl8XOXgkFm63TjcLEHBdjDs2WunSMy8+oV1kWa5qsqLSLjOzx2izk0Y4D5pXFkwVJ
	 OmIfkKQK6hlJpagLUYH4WZgy5o4Iy1SmdRl1LmTwNaREgpIMWCKKLYlS/Ti2oyDrh+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pCW63ny83XiZTDhtRYPG7u2cPmHKUXsowEsKPqJdTRw=;
	b=1P4Eu3+V/Inuv3K9nPE9RXgPG7IMZmSuYOQ5u5WmH4OOhufROTEgWkrUhMby0JIZ6ozn
	 ykS1K0mgvdzMwvLZoNNnarOiI4JWUsfaXVIOmWSIzegwtsbtGLWE+n+Oi7Ivs2WC4RzxH
	 D7QrvdkCVuYY/JgowhvCHiSkjn9poGGc0t+cuDgEnDmForwMH2XE8MvhDSDkhXBVSutkX
	 iOy7RPxelrLvB9Oh7SvoOp691MDcEYFNBcRB7vsIskovaXQuRMH5fK1NHzVhIYGzmvCNX
	 +zIFTc1JU0gtnnlEOmQ/02C+bSIY/po76mF+p2wUoISHTC8ZwIyg+nelLd32AflD8gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EduQ3it1;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDB6606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDB6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EduQ3it1
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3193203b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648894; x=1796253694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCW63ny83XiZTDhtRYPG7u2cPmHKUXsowEsKPqJdTRw=;
        b=EduQ3it10AvwcrGZFygvafX4/s08ajPrZ9AFWJASWXvAkNzzb6C0JwTNLauQAZEn57
         8sbshVnuB/Bzlup5YhWPh4OyOTkWtrbgapT+9XioRGKoKAcSZrIIB/byvCoU8fz1Yv8M
         0QADQwsC0vX7O0DKa1loHDk/wjHyrCBaMU/w6QggYVd/3eoZi0nmGJP+dyOZjoysWKdA
         Z2U+OxVTDohfsxXfQ5g59D2w1+RWJx4Ao2LG0fnBHQn8yFkmRE21KMr/i7f6dF8oII3N
         JVLrPACYEgQVor8fpl+BLLAKFX6U5yvuggCsm+/ulZgS2RPv6P6l/woNPtSFvs3sTj5I
         XSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648894; x=1796253694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pCW63ny83XiZTDhtRYPG7u2cPmHKUXsowEsKPqJdTRw=;
        b=tmhbAM8QsCg8gYQbW8H+PQ71uIn2XT596VpoWOBfmIMhZZSMXAnmP51RvK+MKfMclP
         FWvRPldwYybv200YYvVgEgLqSwfQKt9+LM4kZgRuGZAEvFh10CPC5EwkEtn2YduH6VJv
         TUcnqtYVtF3eVu8XiYJfN6WKSKhS5V9GaokaQzfRZKWkNUyifR917j12l4LaEBlZV44U
         1oG3yWrd6A7n23GBZPOzSVt+KeHjB55lKTuQmbRHjh49uSkXN6ghRR2iwMtOhR8k+3Gt
         Epkc32SbJNDYNhC9DU5lZt1vebnGyQDTXR3AnDqueLu+hoAjrLjuFKUWOgN/LRuAts6N
         hZVw==
X-Forwarded-Encrypted: i=1; AL+hErG/VMZ3gC8c4MuI/IViqCA2mX0ghEivE272uBVWULk5UXynF8rIx+DD+yta+VVS4wvgNpvqAj2WgULXy5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZhwmVhI27GRppRq6elhBOnHDlHj0o/Ss7kr23DXgwXByXjexw
	KneJT95QLYZEQ5WD2yd0cQNm9G1gS2PJ7Aig5ruZvX1OIp8LRYizuiWc
X-Gm-Gg: AZFdTZe55Mek7YpjDPwNrdw1DioXxbSe7RHZ3qpwKNkThv/33hCgg7gYZtahx4fPYdr
	NVqkxi2dWw4s4c1hXiabc3KK8tViwvjeojHla8cgM9F3eoQswuLPSRe4wkHv7+MxvFU2ITinDjV
	uxuGFpd0JfAKp9pqtGQPAgJqCnLINT60S2ZJ5CD+0pr07vzZZsLIvl9qWpIG/En9TDqxcJHC8QW
	SmaQj09nfx3jxYJIwKgoSIQX7KrCTgVFpExgP6hvpYvkXy7e8NN13w88D6uVK8hxRgqWWqLzJZC
	kb9cP70gaj2ojkZ7cyYSqQvg0N1RZl7Nk+zqAbT1MzD5ut3VGtWt9GxPl3uBU1YyiN4u2NJQlLd
	vBkGIUWgbDp56+eGcbUn36zJwk3mCe7nYyDHMegUHmf3w4MXdSw/dIMrr4FRIjrNeTAbSOquNBO
	QYje+kKuCyyTD2gbxSDdeFsZQmY2+YOtOoK0c/CJr07VOAY9xZsyHqySp88LsrPa2eVt6m/uLhd
	Q2rDJbzgDFC0GaEUpUIEvhnyR4jX1CtUkcljr6JaQXK21Wup+K3m6nlZJz7R2x/MTOfvz1YM5mc
	L0QNrkZ915RLeML8khEaTtFLYti2Y5D2LiRAd3XTlBOmN7TwiB/jIibRwNVdaFZsVNRuub3VVOO
	oofgG1Ju9zAv7AVRmrw1v9IGZxJgdQj5TAIQuePDBRJJnUUhBoqCTLDZAnqdOHaFfkXbV+ka0Px
	TETQe0i4RLvrh157uXzETs2H8=
X-Received: by 2002:a05:6372:a748:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-4014a27e905mr15369180637.8.1795648894120;
        Wed, 25 Nov 2026 15:21:34 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:33 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] platform/x86: dell-laptop: Make the charge end threshold unsigned
Date: Wed, 25 Nov 2026 15:21:09 -0800
Message-ID: <d46ed46896f3712e8a5368f9c2d8ef1bbc36f815.1795648586.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795648586.git.rosenp@gmail.com>
References: <cover.1795648586.git.rosenp@gmail.com>
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

charge_control_end_threshold_store() passes a pointer to an int to
kstrtouint(), which only builds because the kernel disables
-Wpointer-sign, and makes the following "end < 0" check dead code.

Declare end as unsigned int to match kstrtouint() and drop the dead
check. kstrtouint() already rejects negative input, so the accepted
range is unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v3: make end unsigned int and drop the dead check instead of switching
    to kstrtoint(); retitled (review feedback)
v2: unchanged

 drivers/platform/x86/dell/dell-laptop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index eca348497ac3..1e2867f182c8 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2380,12 +2380,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
-	int ret, end;
+	unsigned int end;
+	int ret;
 
 	ret = kstrtouint(buf, 10, &end);
 	if (ret)
 		return ret;
-	if (end < 0 || end > 100)
+	if (end > 100)
 		return -EINVAL;
 
 	ret = dell_battery_set_custom_charge_end(end);
-- 
2.56.1

