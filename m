Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452785;
	b=AE4+Zkx0kAQwJFIR8Xq1tct0kax3xX829MRN2Q36CXHgDOPKuYQO9ld+K7QfTl/Z9LxR
	 ki5byrZQ0qXLdOoDTTif8l4axFM1Cz36gZVahxHx0bWLeaMQKG67h5rghQSmip6MtF0wg
	 TLtVOlFBuKONJwgj0OSeV86eo8iNjep7NuudVnjOLVBez8ajP9haFDXX05zKFK3iyjCRM
	 DX1/2NVcH/CTIgZG4jjRlSriVu4pxaNFPhQj8Yle2OPYncwpJOsj1pzodsIeNap7j0Gpt
	 7b8RqkDBrknAlB8MTY/B+ElmkOjiatcIETGPRhc/FLdRHJTC0IrVbjGMTCkjyjFKTww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ROav2NeqSbzB5BYixiJ/XiL62TG6L02nYYk25SHoeS0=;
	b=S4DAyPIU0zO53YSUXsxiNDKy3wFAq78uijbv30F/LtkHHGSiPVpqBtfN/fKgSkcJgrvP
	 Z/DYkbBsPNurZbuMeAa6H8o6cOhOeZnNjuuf7naGV0LP1eus0EjBawCY7yKgxF8ekyGF2
	 E7uxLifOmkptDipdeYMOnzZgdJrn1MchXRzsiqAIa9t3VnOflt3zHdG6vYamc034SZsVZ
	 PBb6rYsfR0zYvgmwKDJwcC6RJt+AqaTGfXYJQYd+WYOUT4lnzTG7XxRkrxJN8ppivFMDQ
	 lGk9XE0/yV4SkpmXGYMPZrh855tPphEToya9Bz+cOx+2uFQ0tS+76ZAP1raTsN2lcMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKmpdOlL;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC910606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC910606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKmpdOlL
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so10489758eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452784; x=1796057584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROav2NeqSbzB5BYixiJ/XiL62TG6L02nYYk25SHoeS0=;
        b=hKmpdOlLdUmdZb23Y8BQJiCwpaasGgN0pAC254aazMxKHwQFlQtXWbu7qC4zxbvh1z
         2jV8b+rqhrl2XpTm3k+0eK3Pyz3cQ3ObP/Q4E+luVllIkxZeztg/DUEwWsJPs956Qnuq
         RLVEXxX4Ec/BDu2gBV7V7mNQzg1dzT2/4Baf0xGCKMg5kf2m41k8L9+nVAhhQEFz8Wxk
         jWwr+PS9Odn1EtMAv4obpHXAirDB1pKrGfI9l/rJfSKoPaVcdO18s3B9QaStPLO3Il9K
         wrU12Sh9QNEu1I15iX2mtnHOWLfUH67YIR84/nKDk4ucaXWCfxqxSBZsL9DwRg+ymDgv
         ds1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452784; x=1796057584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROav2NeqSbzB5BYixiJ/XiL62TG6L02nYYk25SHoeS0=;
        b=l/xmR0p3zbaPle5BAaOO/5GDD4fVvBmlSp9unHzBa7k/5g+uPmnIciW3P2ZJQc3m/6
         hwYghil7gue6qdDZToUtILBRtCDhD9GWHgKOH1IT9ckrUoQv+8m0hFqb0TC9IxhD0H6L
         H8lPFVzpqofh/SOTI/YqK84nwcet3mpUahq5fuG9bkdGU7eU3kieIhPywU3amwv9GWU2
         W/+worT5zyCTSJ/hk5L1F3CjNbYsgChpXwz/K5wxih9KJOLmJOzTcjfDTmwz4Jl1G11K
         FBmuJ9yTRNRA7a8qI53GnRSX9e51ys+NHDC/jnGXcj8Dlwy5xQctemp4a4npROR97nAW
         UXWw==
X-Forwarded-Encrypted: i=1; AL+hErFiwJQ4TVdOaS65l+DVsSAM8ZWDxFPpWQwAGJR9N6McC57lD2MeNoo8gf97nbrYaQz+EtWoN5fceglHVUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KIRQjwLn2RxSRwufmYUD2jW5pi8bSfctakk9PmVukZ4QJ4Iax
	VrqiThG9aFVUDzqkFKAToOOssJg1tJnZ69WZjm7+uJ9/LIkyu9KcJmfV
X-Gm-Gg: AZFdTZeHWv7rfg0WJLge2BDHDfGQ6rKQTlcWMAS7lxadwdrxTTMf4Mam+/3nVm8XWvM
	qpjsXMbvY7B8MOokk4TcF0qs0j2yNBtEpYySbf8za+cevOWW1KzYvOqaxfBoS9pQXjMNHVOTNN8
	HUFABQJpSkk069lFOr52UasjJihCkbYilTtJV8k8omc9AO7bMovDQ7S9jkZEUCqxS0AGJcIOHnH
	QKrrdvwdw6EetsYzE9/wGWR726Sj9TN4t1ZGzReVu4D4iJZ6Q9zUrGPWUfXpkuFRSdK+g79VBH5
	QU1/HishIZT8KoDeuWqcpW0v/BJ/SJbORWhnPLAlhgvdNdX6/jUqytyB7yCMDTMlPBF+kc/xyYp
	yt6bjgDf66ueofChFBUxFEylwC5ET/d59TWXlhNsxKAB6Xh0yS4z5xmCBxgHeTGbLeuth0nUy7R
	V8Cti0sV9vCJ8VgaljBdgSfBOFzwYHZXOMlih+WQCbkDjdnAAcDZrBew+3l/F5k7VZ7+/dHslPL
	N/3VmNJPyPR2+tTYD2Yxy8+ePWRRNEHUY9IOw677ayY0WMp7n5QylFI34zdm1uOUXlDURfygn4M
	6DSSsWOVjAP+7bskJaimviCJ1iYSSJ9pZS5QL3mjZSL4mCe9YCaIInoKWUI4wGkMVia0hFfBvY2
	zj7580zxl12kQLMtfTXa6zQYdVlIfJdKsHS0ok5fcQu4qaJwS7/lYXNcqXmxJLD9DZXf207KeYU
	nc2KmRC+REZUyWW3LsDur1FekZ+/os9YOQpd9MTg4VZQ==
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr23142542eec.35.1795452783837;
        Mon, 23 Nov 2026 08:53:03 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47196668eec.5.2026.11.23.08.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:53:03 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 0/5] iio: proximity: hx9023s: fix sampling frequency, resume and event value handling
Date: Mon, 23 Nov 2026 22:22:46 +0530
Message-ID: <20261123165255.239490-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Five fixes for the HX9023S capacitive proximity driver.

1: writing 67108864 (or any value for which val * 10^6 + val2 is a
   multiple of 2^32) to sampling_frequency divides by zero: div_u64()
   takes a u32 divisor. The check added in a318cfc08537 only catches 0.
2: reading sampling_frequency indexes the 32-entry period table with
   the PRF_CFG register value unchecked; the configuration file loaded
   by hx9023s_bin_load() can put any 8-bit value there.
3: resume re-enables the chip interrupts only when the trigger is
   enabled, so threshold events stop after the first suspend.
4: out-of-range threshold values are masked into the 10-bit field
   instead of being rejected (-32 becomes the largest threshold).
5: same for the 4-bit debounce fields (16 becomes 0).

Patch 2 assumes the whole PRF_CFG register is the period index, as the
driver already does; I don't have the datasheet to check whether it has
other fields.

Applies to both fixes-togreg and testing.
Compile-tested only (W=1 for every patch, checkpatch --strict clean); I
don't have HX9023S hardware. The divisor wrap in 1 was checked with a
userspace copy of the expression.

Arnav Kapoor (5):
  iio: proximity: hx9023s: fix division by zero in set_samp_freq
  iio: proximity: hx9023s: check the sampling frequency index
  iio: proximity: hx9023s: re-enable interrupts on resume for events
  iio: proximity: hx9023s: reject out-of-range threshold values
  iio: proximity: hx9023s: reject out-of-range debounce values

 drivers/iio/proximity/hx9023s.c | 35 ++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)


base-commit: 793d80b04b6c4f7f896c273567f94eccd0fac54d
-- 
2.53.0

