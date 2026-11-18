Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795005828;
	b=OfRLeVCFAjHeIXnIh66jucfpwLVe/3VvPN+htQOnfdsmIp/MdgvESlf3Wg2veRIkm6+W
	 VsZtBU/1psNnzKvFt3N4kOtIVtJER4EsyFtP0N7J4reg1Wffj4qPZtGGBsl1GDr2Tznkw
	 MYnvQRjVgh3VKKd4bPFM2xw9am9jlZa2+AzIsfwu+3wvOxhFl7TUmTivErf8YnT5veGXe
	 3xwfmvcLg8sdE6O8hGt1H271uDxYfHrPqRedljcQXdXvLfvuEoCAFM3GnXNSZRSz8eGUm
	 oTalhnTQQdwSPzNXZGU2Lx5Xnlezsz1OTsnpAD22m8ywrnk0B4U+Vc6EGUSQEljqu0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=HOa9a+YmhCohrGoQIoOJu5k2eiu280ZQTpGsvtsQ4X8=;
	b=mko0CFEklajvmvGjg7sjtlKcf1jtaHfrDRv7bI2T2buZhgWaxawgWqSKuZ+uO8k5yQR2
	 cZXMLR0OCehhfu7XSPZlVXPr2xMS7BvZICI90jkCwwEC9QZhff3e8AVnR3GyMlDimisUi
	 0OtZfXTh2wHm8zCu5/a+sTOjG21+nfR8tWiFW5HkYjsFzOn5EQqi9/f6IfMRZHYbONiKl
	 r6mmlUu+47vVFgG0W5X5ll6Jk/dOBlGHp7KTzGZCBG8emJLP3dP7Vw7gROlqWZ+svHlLu
	 9Zqigf7jqW+WaWEtcrgQe/KBQkmmHRmOfJUDE/XVljzbhIQpOIB6GeaPMOOcb4qTHGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAXTJNPb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7B3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAXTJNPb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so888117f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795005826; cv=none;
        d=google.com; s=arc-20260327;
        b=YZp643hB7rZgQUttKOZtj/R/YCMTK+5iq48nFFLvgIX48k4a/cUhh0nZDKienoprwk
         NjtjiTeGO5p/Jw7EwtUztBEfviM6JYfvLeynDbykMBMG7qR0+WVpEzteilsuqBY5IvIY
         Tn7dlKwdnwoo2AnmZJMhV7B9uJAZkopduGw0/27HBo7KnHBpC4NlKizmI6EVonbTZQmG
         xk62bKZKnux2puBUds8JeNkusU3sLSHFTA/U6mQ0RwPQHvhODKN7qpDcuB1HwxCVLvXT
         Ha5XRsO+8OlVdQmJ8X0IzyYvNFw4qbKjcg2u21IHYSNQ11OSjfmxOy6ZjIxRD17cx2Jt
         0itw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HOa9a+YmhCohrGoQIoOJu5k2eiu280ZQTpGsvtsQ4X8=;
        fh=nuRXkkPgSQw/gcGDLH/q7U/HFbMZRi8pzWbJ9rewg08=;
        b=AExay9kM5HJEtWW48LhCcKy0FUFDQQJ+jOwmAdqbmH4hf1Yr5K7NNZFPv2jkTYv2Gy
         2+qIsc6u9MS2+8xnT5+4ILl+DeGQbX8ceNWN4zcdv/ussFTgHAMcorQfmXmwNl0i7Lx1
         WKISGzSKQuveP0olzMLbQzi3pf0mxnZv/dbKRDeqEVB8jzQ5/JdR5rqd7/3LLrJ2lrHr
         pQqhMRvhzhgi1Z9sQtRTSAGyYCV8Rv8MQhHDr0SnuDYOdnz1nzJQo+mkXz9pcpk+C6Hy
         EmMFnZKZwxiKNbCjYxZoQiOIt0MREU+oNiu7mT3wWi4an3CtTU/Krde3nXPrFfL6+t5U
         dhFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005826; x=1795610626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HOa9a+YmhCohrGoQIoOJu5k2eiu280ZQTpGsvtsQ4X8=;
        b=iAXTJNPbbCN659b9MtFE9Nq3rMo5jF5bTb9kRrR9tpOx3pdss/rcDpa6WK1UryjALr
         ZBJAlqBA9S5KVXqKFLk59uXQ+JUt05h8tmHqKLwO6fYKzbcrvotCRgoMHWFZTWpUUGmB
         dd/cEU9vQfDFf98lUVbzKxspwMrgKoAep4AMOAUa3N/5hqJfMn6n6m24xAI9q6CbSnab
         j6k8/fztBZ5YoaPKZ2yuHtmbYUPCRlIK74ftjquzJO76AB+E3JW+utqEr99xIPLtmall
         T21cqmj8KzYzPEnD+2G7O38mgLT1PsFavjqz8D8fGobB+4KiwEN2zb9MY+grF7Bsw7xW
         E6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005826; x=1795610626;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HOa9a+YmhCohrGoQIoOJu5k2eiu280ZQTpGsvtsQ4X8=;
        b=yc36bTBmKMxIw8dcH0IjHpFNXmQYKwHPX+uUJkI3V0lQTvIy1ZS5Kz8RSECimeZb/N
         BbudVV8gdMdbiCkhdXu0BS/CQQCk/UKAzaGQYPw/3FSLJdqFnh7W3d4jY1BXhyp1omrf
         QJRbyGwADRi5x30ozhXgatZkxT/LNLJmon6u6zPJGxUUSd6Q8sC3qIqDPlF7eSUmoQX6
         ysu1OtkWjpN/GVUcBfIvFZfRAeP/Mhw2RfZH/M5GlwlzeZPRLsQ4ZGQhjZ228W6ItTQ3
         aWwJIipmIiPy7oiPoYKedohbGlir4OlMsFJwWuFUOn9K/Cdex4hEEhda2xmRFVu/PobG
         EFOQ==
X-Forwarded-Encrypted: i=1; AL+hErE63LCAvgwRq46vnZR61P2G2DfoRd67pZhvV92EiKumYS2uJ0Qix00IJX0H8lgtyvNubcXirMcEe8lugMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ygpvO9ROjKg6qEPM3Plkz7ulndTTklkPjI0+YOKnGptKcdfhT
	M8Za+05O2a3BD18SFu3kY4Ir2/e2TBRrykJLssjlsQdZbypSmG3NLrQ5jbbe5j8EjKmC65Z97Hh
	Om8SazFFyBAMHf4yYAStm6HcwnzjEeIw=
X-Gm-Gg: AZFdTZcsCj2isyWDBuKaau9zg+7Zyn1XmPT4dbppCllmyU4rLTp1FrgMm8gTEgxUkkg
	+r5yP2er+K0lDcAG6+WeAOg9BBCN79OXpIAdhnoUkZ5eK7KG/iV7V5naR204fsBKApt5FFlc+dJ
	j2IJJz1rgC8zUHI/Y44lrgprcTXtmwvNASoIBweTuwJoP8EY2t0TLsYY/VDqLG0sRS1lBk9Ptm4
	HdxZw/LsLaQjACy5MMFYAhX1Zb5r2kaOtjbCs2pCcpNd91GjTvUaef2d44nUe8tpejR/GU1UQw4
	q/JSUmGBsi/uKVYDP5p0ilV38ULdmxaX0ESfcF4Hnzl9Fs2boLMG8FD4K3L1huWmEwZ4dAIvAor
	ZCZ9eNQCH/7bbJAwvcNSHVnlLOHu6p9IFoQ==
X-Received: by 2002:a05:6000:4a04:b0:4a6:8012:19a with SMTP id
 ffacd0b85a97d-4a68012033bmr4116923f8f.22.1795005825888; Wed, 18 Nov 2026
 04:43:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Wong Steve <shyckless@gmail.com>
Date: Wed, 18 Nov 2026 20:43:33 +0800
X-Gm-Features: Aa3M54ppZITCCGdeh2x9pwMNL4N9s_TEBJJomvDgdCI7vdkibDlWPRSqczxn-uw
Message-ID: <CA+X8SdhwtAT=XoRXf_1=WBfYYrc1MWh1sywQ0uUuQ7b_b3EOeQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: etm-perf: reject events that exclude both
 kernel and user space
To: moonafterrain@outlook.com, suzuki.poulose@arm.com, mike.leach@arm.com, 
	james.clark@linaro.org, leo.yan@arm.com, alexander.shishkin@linux.intel.com, 
	mathieu.poirier@linaro.org, gregkh@linuxfoundation.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, danisjiang@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Junrui,

Nice catch, and thanks for the detailed analysis. We ran into the same
issue independently while auditing privilege checks, and I can confirm
it is real: in etm4_parse_event_config(), and in the same place in
etm3x,

        if (attr->exclude_kernel)
                curr_config->mode = ETM_MODE_EXCL_KERN;
        if (attr->exclude_user)
                curr_config->mode = ETM_MODE_EXCL_USER;

the second assignment overwrites ETM_MODE_EXCL_KERN, so an event that
sets both exclude_kernel and exclude_user excludes only user space and
still traces the kernel. perf_event_open() skips perf_allow_kernel()
when exclude_kernel is set, so the privilege check is bypassed and an
unprivileged user can trace the kernel.

Rejecting the combination in etm_event_init(), as your patch does, is
the right place to fix it and covers both etm3x and etm4x. I went
through the patch and it looks correct to me.

Reviewed-by: Suyuan Wang <stevewong@hust.edu.cn>

Suzuki, Mike, James, Leo: this still applies to next-20261117 and the
hole is still open. The patch has been out since August without a reply
-- could you let us know its status? Happy to help if anything is needed
to get it picked up.

Thanks,
Suyuan
