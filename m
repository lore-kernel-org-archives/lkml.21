Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060669;
	b=DFglxNqBXt0CgjF8LNTiKRDwq8fRShyFDOA3uokPSqm3RdX518FK2ln5ykP83Rl6kXAj
	 J388b1jrENDjpbILURaMTipBoU+Iu/2hX+tDouBIjHwwd5xdyvTbKGg84DRIvMy99wH55
	 UaThmDAGjYqJPt/VBDrlepdxIwO8j7pxIEvRPcQgHTANF7D3B0LUdPOdGgL2lrWgw3xc8
	 bZQ10yzFZWdhncXVGgb51OeoJgboFqE8K+GbQdRUc/rGHZ0EskUczRf6yBwwguxmPm3m5
	 4e3w9kXUMF2htLr90Xh7FiZwCsUhVP2F8Xu7aamH09eUjALV3znW0O4X5tHCOUiitZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BKHwVioFID9w4JdnGIv32WJD2aWmVB4i12sx6XZEIoA=;
	b=kXJZaRy+ETJLP8V2MNiLg/802nH15iSoCiFDvcnLrBDFgf0rvsHI9c2dVhzR8YhkL0k9
	 VDmkjuHysehlsgcImm3WDwQ7eJ6HJwBXX9MgKCTKVJnRsWhCyJwtgujrS8qNl0RGkcwmk
	 puxAle321cEmYg+g8d25rxhjm3C6NWEOWiXfZgQYlyE/LRQry9qHhNhvFKFAEFFnHXELb
	 n9c4nzVhjoOcXB+s8pJLPnsOgWO3mgXZ0a4Re4RGGopVA+kIqQJ+5nhRjOE8VGpOhuFxB
	 w2zwbbeTU4T3EZwuL+StItaR/d9gHC2sJASwRal9TMsD2AzEj/nKy+G6wF4+oBzbogA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3zhn2g9;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A01B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R3zhn2g9
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so2056266c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795060668; x=1795665468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKHwVioFID9w4JdnGIv32WJD2aWmVB4i12sx6XZEIoA=;
        b=R3zhn2g9kEZ3cLgMPXK2p3qkGjTnV4a7UfvpAuoeO8XiO46lJEb3Zm8DTK4D+Olg+b
         /f+qJHm6p//P6VtBlhP20tSYp92WVHjcx8U7EeiHnHcffCORV9NYXVArjFIQPq8WXLJk
         whhIShHk2t9SwB3zMpLipJau4u98lrcGmhY4qJ9ax3sAcyR3OIusvbTZx+aTyhSGIRb4
         nMbuzidesHZegnC5R5t3d34oOTSzMmnWQ8TPtN2Z4L1tYOrBCeCsF+JKLaaFCtnfVFOx
         CEsN8pKdYi1Fgh8BZha0Jae4QNvu2uWAHdztN2i1bQZ5/xS7vvzYFAAZsdrRlh8kCaJM
         Bv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060668; x=1795665468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKHwVioFID9w4JdnGIv32WJD2aWmVB4i12sx6XZEIoA=;
        b=ZWMPSO3yFc1M4fnMmWUJeQKSCy7iD81Oq6ns2gwlISHkwBvI9WS1pDeVNEYjDWVUTP
         /X2JOdJfzbpbGt5KHs2CwuJU7SNumPuF5gJYWiyDbm4EzhAy+J67F0i8Fv6smgQyC3in
         W0fiXQlQ1OLg8rv5S43AQKG8zT3MohT2D4qUfsKJqiiluDImjqY8WcIf2dm1AphMtcm6
         JFLZgp3BnAXYO/I9db/iE7upRpRVQWNNpCi/TUbAGAjVrejPeRJpT9V9D4GuFejx5nTU
         gl/wmVZDjmsyHCuo6FB0W8lGfpG0/vkcOqUgLjC8o4LP0G0VHZl2L95Fj0IeWsnTHbtW
         FCkA==
X-Forwarded-Encrypted: i=1; AL+hErGbm06RWY+cZAKxQHUTsQuI4JQJVNCoFbYzjf4OYyrSQUT/Nhj+OqfQMQ1bVK1wn2FP2rX5yPD64qFHKzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K6Ml6UlKspW2fo5fip5G6MnlMIHadMibptrYCwzBg1IvN69BE
	ZhjiUZZRhScGZ+dfxSvW4fQ7snXhCOd/a5MEUgu37H0/qaCrmbeyCbvG
X-Gm-Gg: AYBFou0z2ZCMM0PO2zQ8KUFefCvJczSuOVjxOG2BsGQGLh8lztFKDUEAc2216mcKaex
	xKqt+Un/uv3tIfX3trFMIEs9JIm9hxPu1D2U1sroiA7mPHhhgi018nT7tVQPzWVim6xwL5GzZNq
	SGcTOh2bdDJr7vfrj38RBifrRJa90SzxFqNVaiTdsd8+v1cVZv8dfVdkSv8/M3Is+QWjBHmVPWl
	wrE9Xejr+uAds4jPmLVEbhcApccfdo3yoLZaZc8+ij0Ohf/5F1KzJpU0FZtJ7eRZoqgW04S8rRl
	SgMcGK6/N1vzxcTfVUdLMavYVv9Bhp7vHY4SAgoe8W75zTEIvRwIQ5TjN14QaFELm7OlBQFq54F
	P9o9wZ9+F7mwKmXbhMtJ7t/sC9OfjGIB0ekMdqKrqBWdVNrPwBHsH6wILFn76Vhlez/qXzv8yt3
	vrTjLnWRITPnNyH8LxyjVfcGpf1fe+BNolp/FfwMJVbYd8VTDFPr3KBAKKBPGRgwp3wUjzfh0vG
	hE50gY+gDGO0i0Q0uzgajF0Oi47Ebm8nS3SPysCJKZLjc8Q/lfL3tp3ya1nZYKtcra5CIu6HtjQ
	HLvurlOuKNpJueyHNv6HRXt4zIP5pamv
X-Received: by 2002:a05:701a:844e:10b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b543c12d96mr4204014c88.4.1795060668465;
        Wed, 18 Nov 2026 19:57:48 -0800 (PST)
Received: from embed-PC ([2406:b400:d4:8653:e135:1dec:3a2f:1f46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm15384037c88.13.2026.11.18.19.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:57:47 -0800 (PST)
Date: Thu, 19 Nov 2026 09:27:41 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Message-ID: <av5ztQNkWSsLE4NA@embed-PC>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
 <9bfdb983981d4bb98a4692ac6f1711f6@realtek.com>
 <8fb9ced500144618b7f43e54c12a25ff@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fb9ced500144618b7f43e54c12a25ff@realtek.com>

On Wed, Jul 15, 2026 at 09:16:09AM +0000, Ping-Ke Shih wrote:
> Ping-Ke Shih <pkshih@realtek.com> wrote:
> > Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> > > Add the ID 2c4e:0124 to the rtw_8852au_id_table to
> > > support the Mercusys MA72XH usb adapter.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221738
> > 
> > Not sure why I have no permission to access this. Maybe it gets broken.
> > I'll wait a while to see if people will fix it.
> 
> I seems that my Windows desktop can't access this link, but
> Ubuntu is fine. I have not idea why. 
> 
> Anyway, the reporter is still not confirmed if this patch works.
> Can you post the update here when getting acked?

Hi Ping-Ke,

Update on the Mercusys MA72XH (2c4e:0124) report: the bugzilla
reporter confirmed that the adapter works with the 8852AU code path once
the ID is present (tested with morrownr's out-of-tree driver, which has
the ID). The earlier failure on his system came from the rtw88 DKMS
rtw_8821au module claiming the same ID, which is unrelated to this
patch.

I asked him to test the mainline rtw89_8852au with the patch, but he
hasn't responded for several weeks.

Regards,
Abhishek
