Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795263091;
	b=NufzFO5N8cHSWjYT/+fzVR13W9geNpWNplLGYPJqRhw5IZVW5bSJ+8xWEp8ms2lqlgFC
	 mE/ajiTH/1zXtt2n1DUvXZxgenkdGQchSzMmOgbbGTP8QCd/6rOmUHOVzmSX68o6WGJ+c
	 ErLc1pzKCJVYML8+KU1cVj8OFxOslEFKP8KqixPUuDBviT4agH3V1ydqmlosOBGyXnvu7
	 fgG5id4Gm+44s/1m11XG0ehM9HXjxJzO3iQr1bSrjuxfWaIqzhcW222zrop8rMa9tvMUf
	 x4/ktDzsldOmDn9gJkIQwHbUQUcpcknkehMl5M0T7jJJFlSxPRxfKX74u6qfyqOIsWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
	b=uaGmZmBi2KCiKY8hFdFlp+8IYB1GHoe/jXU2eVm/c7goUHBc/O8wFcEDRbbGzdGsHLq+
	 VByNTaIlah9jT8fyRVvzccL4XLxEb46tXAtepq33y1mhakQ9MWq+8LL1g7bDLP9dYOm6u
	 Rn8TnxXOeRhOsl8WixsiXF5wzQrfj72FtIRPt/b5dEkiatg8DswIwL4Og7JYJa49+jw/e
	 P4tJqVc96ZZLIwPJn1K6zwJU5Z3XWxVQIuZX6SQEgIhsjhsS3gTfbKgEjSPzqjv4wdcsv
	 2VeneKrlhV3Ez65uddHufZcJl65CMY7vJgceSM5DUDju9zDEnXauenQvnwC2rCllv9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nztTc+aL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016BE606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 016BE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nztTc+aL
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4c685c751so15736257b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795263090; cv=none;
        d=google.com; s=arc-20260327;
        b=FoW797yzpBHXmtGVDuVhhJsuDBjkeDqiLU2BcLHubClFVibyxUhFLmiHxmziqHKuXw
         pm9hdsO16/a16ha8IQXHkdLwnXBE0IPLUovuie01DjB7uBv6yrAEM/6jJv/ZLepFyBPJ
         7xyLyiJ+bqKr9OV1KS4V5bWzR4981pgOqVubk+C/SPs4ZSVrJ3A/jyakVcDDHUYfyjFa
         g+zVNMzIpubtqmjiK9iNTxHpatxPZZ6ZPVJhpEiBSV3T5OWozz82VaE0rYzsVT2JjtdL
         UpoQta762bPk/Bj+BdmRAqsuCCAmLWNUwWKFFpm/26+rrJvFdQZaTUZDZnOYP7ku7Cwt
         Dm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        fh=oRkaErDTfvxHZEmjpl/Oik33mNiF8UDf1kBe2k3VGR0=;
        b=f8ani/uRQixuRUs42FbA9S3d4NVuv3GYvQ7DuqcOtXWd69vwoOJCzudQoHk1y+sTNm
         2TP+K3qINDIBntebfmGAmueBne3HH/YZbWUH7FjVUVbDmob53UoyTCb/JkV4Tq7HVzVo
         NZoZwRDML+QY4WRenX7AUYYltSkZB1RVLW7tVbWtgQPCP6kl+LHIgU4qmA1MRHklBdW2
         pi6HaGInrojC87+FhzEVq1WvMbPwTZlIdFLicUPtfWqQGutDZED/4K54pbFGVZorXsZ2
         uHz0ZRGEt0VLxOAhmjxodP4kT1fHtP43Hi5DyTvqy6mDbDZtUDpDgCZJP+A6t6dROLat
         Qdeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263090; x=1795867890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=nztTc+aL9u5WDXTPuo6C4enyM26FqftJYOIkjzZ8zL45kb9P4tzDdoVVY8ZgKp+InE
         R4VXhrgBRNRjU6Xc8iyYWd9Q5m6+4b/dPVK+jqkLC8VGYOr5VkCheS9rvztn46i+39hN
         yN0JJbe0ltAJQVCstH/8bfbxpsEQd6GmSqm2nOFZcLY4VsBZLzg/Ja3IZ9n8tmmAOdY4
         D/zXqn7pVbtXd/IWAufNzpWa970fGrxojsKUqlXLVd+5txEvabkLaVx/KRMxqbeOU7VG
         OkCOZ1sgZVziPAEWqct+UR15HwSFX+s2v445FeWnsLS/vxFe/ilpesRoFhzm3NYt1EOm
         uiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263090; x=1795867890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEZb922kTk9cPdYuJdRQn/n68pwJkacBa3uckuCCVJY=;
        b=B7+0lgL4xjGyQuboWC7Mzn7HNmhdzzieA1TcVSj5R8A4Xvr5zbxTokVZKfWuDwWEfc
         Kp0TzOA8GJ79jMD8Iau/rhQexmQqKwwJwzGtCHDhEJ9Bg+lDdk5g8TpBi8QwsXxbFdE5
         XYBJI6k33BSi40n245dDffjUVBuCtNXfiFbcmEhGZY6j1AGBRxo3rrt8/JZC1omnV/dn
         5uGpSRpMAeH+5TWoOzyDwwbaQ2/C7TgS+PaK/wWDexXtN1eumBtK0fwdy7k3rc1MMvBb
         3MWdnC1rFow4TuBnKWY+bwtqOF62JUjN3Y7v4MQNs3aRaWO9d25Q4n1Sl5JxLmY+ZdC/
         AcZQ==
X-Forwarded-Encrypted: i=1; AL+hErFW8DrEO/vweujna2XuLuz23xVNsS0stFIPq/DiXf7FDvwfaAbV6OcU6JD4kQHZ5K8idnBTf0JMgwsp+5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z2GSgPm5WDMnAmKGeavnucTg4nVGphlYlCu04cq3ocgVBiKU4
	73uufLSGd0Ib3wdkq8yhFU7N0ive/arfPtnWA0eujTdwRZVZ7kaNXmaCib9aKBIry7IrihNb2no
	EncKw303jldAIat7IJEJhNUFx/sAfi5w=
X-Gm-Gg: AZFdTZf3qzYcimdohHXwjImvZow0LOixS6JCDXBBUr+4TfYkNSTV5RiuBE/UbwTwdCr
	GJlJ5YI1OT2rah/eqKIQnTHmen2lAB9yIC6oeIgJnk61mbOOvkmFcFnxI64UJbHgyEZHBwv4K9i
	uA7paDqMXzGcr9sHLu8GQRRQVa728bYIODI5SKN7gxl8j2HCnh1QwqruLAzdOYLwUuzKsgdZqUq
	igrmkD+84DNvBInlslzlh/2fKQ4I5I+qNUJ0ulHVqjlWDpTuo7xEYmKdVq36cUJ+qBZ1GT12bSZ
	eUEzKxDUcYFbM5ivEtGQoSu+t1zle0m0W+0SK3Ul5jnugPYt0Su/hJSYYVd5NeXH0Yhxj7SRy+d
	syjFStMZnvm3giD7Sgnlx+DK+Ed7SWbb6Lnp1DBkNBVLF6W0TzHCuiiIiBy3Bco4hk1/IKEkiz5
	4HfNVsy/m7/4KKHqKSsGUvkL1a+w==
X-Received: by 2002:a05:690c:61c4:b0:8b3:5fd6:a544 with SMTP id
 00721157ae682-8b52047e1c1mr19674487b3.58.1795263089936; Sat, 21 Nov 2026
 04:11:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
 <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com> <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
In-Reply-To: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 23:11:18 +1100
X-Gm-Features: Aa3M54osrg6doytRUFLjK8s5YltogEr6ZngrwFO8UHAiCYiFQIm7-VCyERe-Cqo
Message-ID: <CANpmGNtfmk8QODQf9x7nkVSr8F+=8Hfh8GbKjCOnxvw3PXCTFw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Sat, Nov 21, 2026 at 10:52=E2=80=AFPM Michael Reeves
<michael.reeves077@gmail.com> wrote:
> Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
> It's just 1024 like all the others. Can you apply that when picking
> this up, or would you prefer I send v2?

To fix this and add proper T6032 die1 support (as suggested by Janne
in response to the cover) I will be sending a v2 shortly.

Thanks,
Michael
