Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505478;
	b=TsJyI66Unlfp4luAKRkGrqc7arKH4kmBLs8j+Ljl8+k+VfV4iY/+rYr+V72jVZTz0efA
	 dNjNgagEx5PofVPL4dU26ISlOt9KUJeSthdmwV9bfwEDe533r62lr/bVqqUrAsCbCkPNk
	 DX/s31kOQlAlaSMjtP+i4YyFM1uzVl2ctp8oOHm44obVa0OBySZiH2fcqIDXuLA3Q4Jhx
	 UGTfEbmQW5vGpDVx63cMZxrYvawo3tZ+2y5ebdI1M4CFKEUASTygJzdzstoAPBq0kKffp
	 GY2neoKmVsV+5z2H6KIMASDKqk3k+t6USfUfB8T8Iw4tbf49grdphhEMjrX22570cIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uz6sHl5m45qwME77LMFtXBdETR9+QDAW2tNZEQ1kciw=;
	b=CIn3bceG4nvBhfoe/4xKnXHhUuubXIEDbwhE64c29+kM4rgNIkEd5nJ9EzS8jbviqnDY
	 cVlMwTvDJE4UjfTovPR/0I6WlOiWqvAJfp0l7uBEz4rWeQS46q6H9q26zF790LwgQRgn3
	 4blgwa8/arA4Vzn0UAmLKEibXV6lXZC7Y2obegs5BKuKX1/ha/bfja4JlGMrbFCrmaeE5
	 6Fc4Xls4i1a4EIh70afgjhqe1DBA73CfgSCrL6WhRNyXM8TJdyVhvqHKAewP1x5/Zx1EX
	 gOqiUBn2ogz5hgB/LHXowbpAAAjyT1HzIIgbBwo/g/7okeZ5kncZ8ql/f+FojCAYsGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhoJPA3E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B5B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NhoJPA3E
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso778567f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505477; cv=none;
        d=google.com; s=arc-20260327;
        b=oxRnrrtsdg2U/gA5NlLVniYKRX+jd/Z0iaist89OI8ahNX/0KKHRrrRX8JlBEvqTdj
         xyhaoB2b8BSZZ2nEqgPlp11WvlCnLZHIh6wvqBw62kCCPQ8tBVzKWoQ8MtvdupGIB464
         rY25LdczYE/8yTT3ldtueoc/k1f4VA9hb0b7e1CqpkI4+f+P/5EMCTnFGseAJZ3icL65
         L+YHbn7DRpzp+biciBhunNs8WSMa/c5XjHxcS4iZjnKdwHodoD4NSFrH0G+Se9NpavC1
         zxl4bLuqXNE7ITlz41ulUkrvhRJyEIwK2FqZVievLAOKmPVwz+2mKNsXOA0MVhgis1nv
         FVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=uz6sHl5m45qwME77LMFtXBdETR9+QDAW2tNZEQ1kciw=;
        fh=R6sCwXRYLzAYU8o4sj6vyCOwzMmVUQimHRdHgg6Gcck=;
        b=A6b7tDaH84WgRN2QzQrbpLVQ6NrdcvH0H+Z1VxPQId5giDoIBIuAxtHocn5gKG/GQO
         qgXpwlrfnSJFEsqqMjvioLnMNWXb4971vq3L4b5XySA5KU289TTFQ5WdTESmNXxEGEsH
         cHPuSFfeR67AzZnqkY4x4DjTlRQIzZGSmoNxzyLHePBjl1ZvdIwZ0m5Gdoh0Rv53Pnm9
         tFtSLKU72isUuWlnFbnnKNqnVQ14T+fLxQokJHm2ptqlsaq5ieuM7iDoI+pSHzsPBPvL
         vWULItFbJ8FeFmA4UXteRnfy8M5xOx8n8uOqkV5LUj7/Q7l4wXLnGNvxgXm3RLW01ek5
         FAxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505477; x=1796110277; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz6sHl5m45qwME77LMFtXBdETR9+QDAW2tNZEQ1kciw=;
        b=NhoJPA3E6yTbH+3xZbXP3wEewJBzBNu/b6BMBzA+qYdoTUY4uOYxRogVA3wpJICsfq
         3vFTCrb4Pcb7cC6xlpYWm6E94uUOWobTmfINqLCBlprEw4Oz3qwuDcROQDs0TWzZEZn2
         nyVIjelRhCudni2AXYeBn8ANtUolUPxyTpucslpgGXU16j2egPpM5/iFT8R+5g8Rqdn0
         zqNCrV1lYmMqIPAXN5BCeQTkfPl8DDloVtZUEY0GIlspoEU+83qvqSIuPvF+ZSk/UVnZ
         SDS17WVK0g4XLPY5D5DYc81wuQkXumA9fmugm5nVcQAGGwOwcJ1De/NUUF1tuMiiatoZ
         OwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505477; x=1796110277;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uz6sHl5m45qwME77LMFtXBdETR9+QDAW2tNZEQ1kciw=;
        b=g3YeNugUVKo1k89GY9+bgJVB+4Fk85EHaylVZCrPxTe8zURKNqBDjB6M9mRoEBsmrn
         PXstjJbofBYxZg0Si0PeuHX/onZrmjhKV4BYPPVuZ6mPNZKLGTslWSGjWh4VBzjI1mXY
         Oh1ukgqkFL18iSwrchkF+IjcXnYJ4vFPQcgzEfPtMkPXHoPNfi9wWrcPH8NWUNt24aO2
         tWfFj7PteQ1JWvt6AZiSeC6at3M15duJd4eAHFN/SHuUrUdIy587VlCm+j9vg2M45uUU
         GEJaXDCjyaH+5Fqki+J1s/A8npISW0v/U1udShnityslJiTWrGZc2HaPU2mmVIFm/u9X
         UY2Q==
X-Forwarded-Encrypted: i=1; AL+hErFthEK8PmqZwd54IrUi0vLcVdl07WH2chmMQtZExIjNWCloe637bmGxQPXHXdUemB7LYlLo10UhUTAlvLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hQS9EI0NrRdhGnqWpk0+YlFzInzMtDV39RjvkK56rdEavrsoT
	bpFThyS861sg3SuxGXK3CRrShp8aWN/VQKvJAQZzUFxWRq8nO7/02C9S0R7H7eU2Hv6sQ678wZ/
	cn2GauUK9Z9bGU9D51YiQB/InCOzDFiwXqDqE
X-Gm-Gg: AZFdTZcRuOwuAdDplpbJ1hqZi5w5exmibjw9yirSnA0M4ZaWpaG2qmk9uM8RKO5tDu4
	FyhUAFmu9WkHq3eGiPGJWkeXFoFGc22Eru2aoiFjzhZvQ85hKSYvP/xMHf+HQkEdofssyUMzqzg
	VKKeUdym+NfbMglD463ATCk9k8/CdWg65Pq3F5gKXekAkXqWFX/GzFUF8JNE51MdwdXW4lG//iC
	Bvj5JBDucziX+saifuU18EIhe/jUAkUX1T9tzyX+Mx6LzWqkuFHnPGWUKCl10gRc3n+C103hL0p
	6Iyw8rT1Sz2QVquNKf8bAL39sWrQtnqqGfIrsHRruDh+U0oIqN/O85tVppLRTgBal33uIlAIlt6
	8nYywWCK8ZqdIN18UvS3rG05ypIsberpA3ClxelDSq/WnIzOynOCzhzLp8g8gd2d/X6U=
X-Received: by 2002:a05:6000:2903:b0:491:c392:1f31 with SMTP id
 ffacd0b85a97d-4aa5ab788d1mr35237170f8f.28.1795505476502; Mon, 23 Nov 2026
 23:31:16 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 23 Nov 2026 23:31:15 -0800
In-Reply-To: <4ab84021a5d175f5d3793e52fd818a21@gmail.com>
References: <cover.1790612085.git.pooyan.azadparvar@gmail.com>
 <26ac42dd18a98c4928cbe7f6b6adb4b396be4c8e.1790612085.git.pooyan.azadparvar@gmail.com>
 <4ab84021a5d175f5d3793e52fd818a21@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Date: Mon, 23 Nov 2026 23:31:15 -0800
X-Gm-Features: Aa3M54of9Ba4hHMKsZBUUvltNlowKvtouah2uS7DpaePdAivP70yFmQtUeYovYg
Message-ID: <CANC3H+L+hh5XaesFuUDSrFpWGxpfg23JV7oyh+q-TUYqWF8+hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Input: raydium_i2c_ts - validate report parameters
To: dmitry.torokhov@gmail.com
Cc: u.kleine-koenig@baylibre.com, meatuni001@gmail.com, w1zardsec@proton.me, 
	robh@kernel.org, jeffrey.lin@rad-ic.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

Thanks for applying the first patch and simplifying the validation checks.

I also appreciate your detailed review of patches 2 and 3. I'll rework
them into a single patch using a fixed-size buffer and look into the
boot_mode issue.

Best,
Pooyan

On Mon, 23 Nov 2026 20:42:43 -0800, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> Hi Pooyan,
>
> On Mon, Sep 28, 2026 at 06:26:16PM +0200, Pooyan Azad wrote:
> ...
> > + if (data_info.pkg_size < RM_PACKET_CRC_SIZE) {
> > + dev_err(&client->dev,
> > + "invalid report sizes: packet=%u contact=%u\n",
> > + data_info.pkg_size, data_info.tp_info_size);
> > + return -EINVAL;
> > + }
> > +
> > + report_size = data_info.pkg_size - RM_PACKET_CRC_SIZE;
> > + if (data_info.tp_info_size < RM_MIN_CONTACT_SIZE ||
> > + data_info.tp_info_size > report_size ||
> > + report_size / data_info.tp_info_size > RM_MAX_TOUCH_NUM) {
> > + dev_err(&client->dev,
> > + "invalid report sizes: packet=%u contact=%u\n",
> > + data_info.pkg_size, data_info.tp_info_size);
> > + return -EINVAL;
> > + }
>
> I folded these two checks and duplicate error messages using
> check_sub_overflow():
>
> if (check_sub_overflow(data_info.pkg_size, RM_PACKET_CRC_SIZE,
> &report_size) ||
> data_info.tp_info_size < RM_MIN_CONTACT_SIZE ||
> data_info.tp_info_size > report_size ||
> report_size / data_info.tp_info_size > RM_MAX_TOUCH_NUM) {
> dev_err(&client->dev,
> "invalid report sizes: packet=%u contact=%u\n",
> data_info.pkg_size, data_info.tp_info_size);
> return -EINVAL;
> }
>
> Applied the updated patch to for-linus.
>
> Thanks.
>
> --
> Dmitry
