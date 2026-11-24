Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551215;
	b=ynTBQSx/v6HRoqubps9VIwBiPH/QVLF47LGiEujKlE9mS6u6v1ID6rfvvVByhuTVzEUW
	 iL4mExiqzf5IraRpc/t9+y7utadr5YY+0rP7NfTO4IsrnChM2McgLcDYLHTO39IOij9Yf
	 B2BR2cuha1KznnnmylHfrPPbj4TMwVs+D/EV+QgAHV3Dj4qktGMNpKvAi4y6q6pRvrAux
	 WIiNxS5nZVx/GMAm2hoVJoPrIEGpGXLcMebn2pSS8Z0qtF64HNd9Dqfx0XLyGubKg1Xej
	 ZhJtwHSpvVtgTpQV/br7RjMyu/HhPfStmiRBLK91VDb18Bj/YglJWyamJxEcDmbunjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551215;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
	b=toD3HxD4r6QubgeTIFVkMvoGmfQ1G5umYRrPzq210Sc91sxAhBAxs+J5JRX0Hr+HekLH
	 zB22qNnC/NMVJD4BudNMZY5mckQ3Uw82yRIjXyKUYYfezt0fkX/GEHHWOAmsTD7jLprH7
	 qoT7AoMMpFespPyhxaPH5DiAry/BQcbTdzvTRzcCccHpaZsJoo7Ygba2rhr/MGA2iGNf4
	 fYwBYZwJhn9Mwv/u1KrEB8VsSQzaTuCvjvEOIrLt+wDPOaAGx0aALej+aSnlLqusCirQL
	 hk1mVm1ay1wfP6PBH+ucAUBjbZZZ2y5TtixsL1jLrmUJu8TEn9WuMGcB/TL6iTHeGcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iPER3Nu4;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6449606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6449606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iPER3Nu4
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cddc250d815so1940719a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551214; x=1796156014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
        b=MhB3MeulxQxnWcLQSVhKjRuwSdefuj84xumMeFfCv4TqIrmtE9jV9oKPSrFqwXn43t
         W5XHg3lM2Q8FfstyTUSBNCB1w9abK0rfpCQ8yrBvSqUgAZo8XLXtYfaDyWSeOO1NK1ZR
         aFhjUKhUT8/GR+W3d2iT1LiDEv5hLcFW5E4EBj7Zy+H4dV5FoMZOs/6CzQyr49ovRahy
         siZq2YEd3IAHx3ACZkEYGcE21DLB3VZT1FzEto9wJQFr/2plFkzvokrwJxsCXBISAd8e
         LzLpNhVRki2Y8wUDv8SmsG1cUCmcXiU3hQx69WVrF7lWkdRmmhGQdZn5Eooh/FqL8iUi
         GKBg==
X-Forwarded-Encrypted: i=1; AL+hErFbeCazPSrIMmNMJQaqmWI6GyKZN6uDera2TeFGmbF61FkKM4JD8GzmwyS4NZwNjldHDB8fpBxSGpJzsOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EIPdJ3AYAFOQKjO4F8DA1l8udbK6LDYD3uOvxXQvxHaKZWZul
	LNn1Hp3u5syuPLFLc+YIBy5+HNRqI3rsCIGoMBKzV5o7hcyc6+/vQlCcbWvryYVfpyiOaOlwerm
	eR1cp+/wvzzvv0/ugV491os8Bs16gTTPOm8BV0oDKUtNWOBQfIhXGzj7rnWWouGJuE+Ipo8dgb0
	w6NaTyCQVlYH5gZ/PnCLrNdIlG97RWnaQ+USEuTOm/01X42UVF8ErFMJ9t5d0mjHPIGNpDd9Ya8
	Zm6ngf4eMnQ1bC3Ge2iRTM=
X-Gm-Gg: AZFdTZd6/Rta64M1XUJIVkxEh4msWBQObhnbxHasIcHvBNDkmC8CZ02zKrudXRmD5ub
	cQ56yfU3Hg34ZFy4IbyMF/e8Xf8FuAH+u7f6wNAsQJMVeGpzi/xOoPtc5RcAp6Vb81vnETyzFPe
	dYWRTu92ub174lU28geIBVE6R7gK414UbYMUpQQ8kDUeRhH67O85zEB98JrUwvUCo6ORtfgEMeP
	hMkcVOc3+SeJOnjdJSpTeNFagakfDQARIFahFXPnIeH+rBC/VeqssP2koxFxEzge02un7qF0IrA
	SDS8fzBuwQSfXaBfKtqy8wPj3ZdXW6mt4JAcUaPTH/WRFCGjB/9ntvPMwLHiQL2xSoR1/+Nzjex
	xuN2db3piJCWkkqP0zBRgbffJ/US3wpN/SQAuuVYmoedVA2k2DjeHjyClviFZ6G80ATlFHj1Tll
	+fcqUeWMErQuLZYG3mD6Alur6mBxx7e+xhccB/tUDJDw==
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr3213499a91.43.1795551214035;
        Tue, 24 Nov 2026 12:13:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ff67243sm5759612a91.3.2026.11.24.12.13.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so28262385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551211; x=1796156011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BBHhcvcX0NmOlb5zn8lXYG+5JCH/df9UZnJ1qUIA4A=;
        b=iPER3Nu4r5LT6OZnZ6QsyFZ5zgc0WpUwgxprR8WKSlU7h9ggDx3fozfUwIWdjoqza8
         3zlpPqddV5ACbN3iwC3eq0Vuk0XeqqY8XhpW5cGm05sKAg30VyElaJnhAOrzGajBlaje
         ten1Jz0hfaQg6pxKOjcD7f43RO6BN3m8pNsVM=
X-Forwarded-Encrypted: i=1; AL+hErHLwHYE6z2FVVfUABS1LG2S153+98GU+rdhpQ7g4cOaKHMaq7s0Usn3sLk7+Tvz3cH+sOzKIRtVDs01RIc=@vger.kernel.org
X-Received: by 2002:a05:620a:4625:b0:949:6d95:f63c with SMTP id af79cd13be357-949bab4d95dmr2635394785a.56.1795551211439;
        Tue, 24 Nov 2026 12:13:31 -0800 (PST)
X-Received: by 2002:a05:620a:4625:b0:949:6d95:f63c with SMTP id af79cd13be357-949bab4d95dmr2635390885a.56.1795551211025;
        Tue, 24 Nov 2026 12:13:31 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac1esm1127270385a.15.2026.11.24.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:30 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shirong Zhao <shxzhaosr@163.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] wifi: brcmfmac: drop glom superframe on header parse failure
Date: Tue, 24 Nov 2026 21:13:27 +0100
Message-ID: <20261124201327.3491419-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116041534.24-1-shxzhaosr@163.com>
References: <20261116041534.24-1-shxzhaosr@163.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 16 Nov 2026 12:15:34 +0800, Shirong Zhao <shxzhaosr@163.com> wrote:
> brcmf_sdio_rxglom() uses rd_new.len_nxtfrm and rd_new.dat_offset
> right after the superframe brcmf_sdio_hdparse() without checking
> errcode.  On parse failure those fields are either uninitialized
> (the early -ENODATA/-EIO/-EPROTO returns) or hold a rejected value
> (the -ENXIO bad-offset return), so bus->cur_read.len gets garbage
> and skb_pull() runs with a garbage length.
>
> Check errcode first and drop the superframe with the same cleanup
> used for a bad subframe below.
>
> Fixes: 9d7d6f95bda1 ("brcmfmac: streamline header parse code of sdio glom read")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
