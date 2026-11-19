Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092410;
	b=0JstUcv51hZ98ma5NdRcJmznfXXYZmzT0CcxCnZvoizPvljRQGFkYGZOXNx1ul5DUBjE
	 CVqKkQugd6p5zQFxeHaeUZRprDnQmQ51+Y6MhMN1DbT9FBr/iVb/O6cQoaqh185Ih4usb
	 z7k5GWdqj/W3Hsj39Rf+M9SQUyJW8qWMLyQFxxNp4A6ba8EsEgmXY3kd0kimILgy/yP5S
	 /NE9npuH8wxlG5yIuUXsxrh49CYr/Yd7mpZlppsmYtjcD0kejstCGzgboJdaCCsb7aqJg
	 3xNNk4l7wCnwQCWIkzFfsVTtoEjYkpUTpxp3k9clKvI+A3hNjyV3v07fkU5QzE3IEew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
	b=TOM2gTEZLnq2aSKTINfRsdXp8wRyV6MXjcgpRohjc0s207ZSd22+pPO0whxtteDnm9pe
	 INDBl2BCCAkJsEGGnza3QMp+RQSm7htZ35QuK++paB5mvDBMT1YEbCoEQrSNbZ+bY2ebk
	 hLCC58Pet/VIgSl7IwNo26+3TfOpLQO7NuqlJTliq/Y7u81TqZkTX605toRuQLB4qHOlA
	 Q4McKpuqQtmlmlmu7iTQzel6oBgJjLGiP19oOURiWcP8uUacOc4TyhHG0uWdqsGTu7dBg
	 4C6870IAB3QLyPg5wfbWJ45RtcAl4hciLKU5Om8hD5xp+cm6pLA6qV0WNcDJfwUZGWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDF2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDF2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2768639c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092409; x=1795697209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=BfVexAMXUExPA/yU1/HvoxaKMziAg/iD+IUkHNZoxPYzkEA3j1C6nIt89AbCwkXPRO
         /cce9sydc7DmUaiiD9v7hE9hgI1ZMsnDCrGgTYI/xVDxscovZXfGZjiTvCQC5CBJ4zh1
         rbfUnR6wOGT+8PMH0NHQY24Gy9AVVc4jze/FJc+s66e4NVtUg3Oi5AK3PlvSTRyjacP3
         aOwAfj7uxwj418/tukp5tVVEF/PUTXOL4hycn4H6XyLCVA0Qkw8gmZIih5yFRhBe6V7P
         YH+9n4wqb/IMKYyg+jwFOeRQEXeGZ58RtlgqVICZ99RkGTmlcRt0tbnS8gt7ZXphedba
         4iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092409; x=1795697209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=cx6uS7J2x1bAGqxb9hGx/9DmKLLnU9zkXVIwS5Fh5/JzuHuMolfNL+opksZmXVshGy
         HqfBSHu2DKJ/Wa/u3BmN8p5tZZYN3bBePVZdMmeJDhVt+igZmS485MPu16QUyTOpcHil
         tZ5/CDhm9/4GWQr4X9J+TDktM7doyDJy12PZR9HYpExgz0bn/uFld1aEfJxZccMlOkC2
         4fV6ec2mHFZNYiKbTsigxpi/gG9Y7WaAkI0VHLdEQ0Vklz1fF8072ezD8noi9hkMsXaC
         kmy+rwpjrLLWxnz0bxmZrdGZgPAXGKxdw0K9s6atHfto/u2+llSpujeo7/ZWBvD5qoZy
         ADgA==
X-Forwarded-Encrypted: i=1; AL+hErFMMEeaNLrDkIY6dZ13GDXAQoYDkyG7smkiwHGgHePUNoGjkol8esbVlDzz9a99GkKjw/a59qJmZCPfBHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WmtdVQirSxJFEDMEeHdfN/yBARtxJ653Vo7FPI0kxmS32hcoh
	cGwCy1/QOI9pR+Jmh1NariJMENRxuHPJvar0vDy0D87HS/47OLXsYNnVHEV2eGDmgps=
X-Gm-Gg: AYBFou2a36MC+sndeY0sxzKYHo84HwRkMu0kIPeNL30VOmYgRWbyoT9vHzPNuJH0IN7
	AAMpBnJFZc+/Vv5hzOwqiC35DbAxGttI/WWUn7tJv8+Z6MBcVQ73HDfyPXw0MFMN24H6q2PKen0
	QsOLYql818jravcn0eLRZhIzY0ps1+j2Rz10AlbCYY18QVGMDh2mp4kXxfUv1Pt4Xilrosb5JxH
	hOIHOzYGfjAEcC5cxP5qs/IoSU5scZxWr4wEvxyQTRiEW7PRv9eU3T3pkA+RsVT3X85bKN+l2rD
	wPdPGkfS5ljOAqV8DLwQqdHNvstaSoCzvGA5L/OzF3oKdJvDgChp/EA2lEZVUlHxlkqbHzdpHmy
	LI1zfJwKafstKvDfpR4EyzfPGta0ztpeg7mp4Xskd435nBBT040f8dE8YEWoms/mK+WKszKoZ8n
	3MmzdsI19RoCkohHXxQwVfyKjSJVJ2Bn5b+F3TV+dD0v//YBU57i9kWS++91A8YUr3JIYkm5fTb
	geKNyKNMgjxtI3+apc4R+4aOXK5i1pTre9iVZcwgdDs7U5ne0s7Vt36n+0gsLuY8NIx2RxKNHna
	OkYAnIwhaCH7DrD2bM4VODHn3ochY8pge08=
X-Received: by 2002:a05:7022:7f15:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b543c3d7f0mr4441883c88.1.1795092408616;
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm13868656c88.14.2026.11.19.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 19 Nov 2026 21:46:47 +0900
Message-ID: <20261119124647.983-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com> <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 06:54:48PM -0800, Peter Chen wrote:
> We did an internal discussion for this use case, we may prefer the solution
> that let the PHY notify the controller this PHY lane is going to change from
> USB to DP (4lane) event, it could keep driver independent with dts for this
> feature.

Thanks, Peter. I kept the mode switch in v4 and explained why in its
cover letter. The Type-C mux framework already calls each mode switch
linked from the connector, and with the usual graph (HS port to the
controller, SS port to the PHY) the controller is called before the PHY
changes lanes, so no new interface between the PHY and the controller is
needed. The cost is a "mode-switch" property on each controller node,
which a notification from the PHY would avoid. If you settle on that,
the clock selection in patch 2 can be driven from it instead.

v4: https://lore.kernel.org/all/20261119124558.1548-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
