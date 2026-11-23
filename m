Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464844;
	b=z3NDwq4LVYY1cQQjO6DjH2HlsfcQqwPTAFYPg2jMwbYGkgupcYCDNJFfRGpuNqKo0s71
	 ubhmyCBK4no3R3QHMC4OYlh3rPmoXnaqGfwXeACZtfm+wkF2Sg0r0uhRJGXEukcgkSBfq
	 DcFIqMZgE4V+i7tJFfHxThH5jmB8AXnVem1phOCsS80b4uShaQpPqi8b/kqjK8VWINaBa
	 Wj7PSskZKaQQv4QF06cM3u9lcrnInpIQQboY3SRPCzoomr1c+ee/bBc2pNhhczR2q6p+v
	 gqCwWMIYBQAReSQekHS+ZC2v+bFIt4tSxpo/uVRpeyaiM9ezDXKxR9r2R3uOZB21DKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dgeT5HSySDkjBdmipJm4ZLy1GjB1CH3yde0pguoA2Lg=;
	b=WYIvbR7YfFz6AE436KwZhOp4Q3oYFDvmA3NRw4DIs+NDn+xzDi5oY1bhVNfou50FSIAW
	 wNcj9j+PP8qLZrJd9ebhU6jCaMC8WD3GxrgLS2k42x80ndJ6xSQz32qTHbjqJXOS5jMIn
	 5/spYGHAM5E6pwF7gTtvrB0nStTws4TArRtl3zaw76IterHj8CRXWl8Gq9iZWAGkzonA8
	 45Q5gSCjrPfu/z2clTISzpEcghEPpMkJCWeiH/BKjuk+vmomzxfzy8sFO9syKW4G4MB/d
	 C9tJHos0K/PYECtpCKVXIWSv7vJraJBVVn0JwzvlkZx+DyiXHcXVTkDZvupkcBcPQ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/QYgvZm";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC0606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/QYgvZm
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38587f3de36so4491769eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795464843; x=1796069643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dgeT5HSySDkjBdmipJm4ZLy1GjB1CH3yde0pguoA2Lg=;
        b=O/QYgvZmhabx3+D1Ox0nAqUklAwki5ts/e5ICD3coNuTFdwkbOEZN1+A7RpaXEaQwL
         Mp4iBvaRVCxjPQ7fVMeTNRD8T8FoxT7n7oxKfV3t3J8vEdjJqUCAKqgmMab+Ay57xxB+
         bcVpILohdXpSCjVMN7aXBpUyixQATBOkrAY8wSTNkf2jhPRN+Q1N5+TQTREXzogel4si
         QW5sgjsw7YTrPRx/77ku31KCZRv/wLnBT0F18Vn/OdNghH4QCpBIP9G2+idR7IOZuGCS
         itNt8FdcM5sVUtZT2ZP7qYHmDSK2KV8KeJFQXljcQIviEb/kursmQKvy6ypAemXGiOae
         +Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464843; x=1796069643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgeT5HSySDkjBdmipJm4ZLy1GjB1CH3yde0pguoA2Lg=;
        b=fhADiqfXtp511rKOcH57g9FLCfANVfe8yqH12WCAuVbpZ0nvB6+P4Vfxov4eoaeReg
         /xZiEPm6CzB6QMyGQrDqUqMGPAQj5M+ofwSi/zOWQnc3vDwCrO40mh6wGa2HjZ2kaL4h
         zllpzDvsuleCxRZuakQxWsm4bUSTlrBq/EvfZPcdYnhkSIkDYC7XHOqnDV/ia4VE+eH8
         UgFNa/MC8KM4O9MIa1XAV7xybHgEeyTY2C0ZRa9s1pnBBYXIK5hp6Be3SgZUXpIamVVG
         mftvrga5aPFb+gkkpY1EaMIuwBD00rJ4sMUB/YG+TuaT34ZVIFlBB6/JTsB4axrbIDcQ
         yy2g==
X-Forwarded-Encrypted: i=1; AL+hErElw5TfhK9k2CgndcKHu9UaaSLN3XT08f57lF6KUILXHSRlDtuExtjURUrjgMFyzzHmcrSCoSJ42ecjGkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z87xcfhtyg9m+tvqSoZKVeWPSC/10g/a7vEn1rev18qwhakDbGj
	Pup0MJtO8fdHU+Ktxv7KgJBKHCjL0USz0ArVYqIZxltNYcG03J0iBahj
X-Gm-Gg: AZFdTZePCOzV5lUU651g+6TprmxHaiprD4oGt2l1UwnQv93Nrj5crPgT5yXpRU6sqI0
	924FqOffURzR9MHmZW8G6VbAFKoKLJlwHysu2zKYpMYJgyq84a8UI2S53hCCQeT32DS1nvAGVIX
	fNU0qBLjb9FETH97W+NyekKVWmJVQ7F7L/6IpoT+L3j1XcAHOR375cSEHVh2ndwdWnsn5UQYW0O
	KhXTt7xjFfmNOGKF/2SWSvbdG8Nj0q/8sNMlmNtcezUkjoKEHrQNQvpYu+A27kQHVdFv6NCv5LF
	oH6IE4H17wlLpUFTxXWDexNZAkMH7qracABUTUKTpPQacfc45L2/5swsSCdpzF5rIzSU7e54m8q
	zsYPVmMQWiuVHzTaU/QRUDPeVSrX2F3t994VlshtCN4kNW1dOf7c58iCp2edRzx360AdPGjIfAr
	2mFiE2i6jdBkr6/wjxx6z2pBETE0cXYJTNvpJG1yZCCwVuWy9aCJPaZIa4Amg0SLz9Nk+RJNwAC
	9TRJu5lf6xMlD0Uoch6e0pLxBDVLoSMPW2JBsiixwXx1iO7C2WyF40Jr5bvY0YjjGdJOtIGEwWS
	KbFdg18EPcsGG6sKUb8dtmABLPd7WtPmrdZr0CybFEJV4gAyGF0Q3ge1YQqa5fpTzXxud58=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr12383687eec.1.1795464843155;
        Mon, 23 Nov 2026 12:14:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm4836352eec.9.2026.11.23.12.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:14:02 -0800 (PST)
Date: Mon, 23 Nov 2026 12:13:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	Ronald =?utf-8?B?VHNjaGFsw6Ry?= <ronald@innovation.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/10] Input: applespi - cancel touchpad registration
 work on removal
Message-ID: <awSebEs9zEV7GDF8@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-4-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-4-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:09PM +0000, Lee Jones wrote:
> applespi_probe() allocates its driver state with devm_kzalloc_obj() and
> initiates an asynchronous touchpad information query whose completion
> schedules applespi->work to allocate and register the managed touchpad
> input device in applespi_worker().
> 
> applespi_remove() disables the ACPI GPE and drains in-flight SPI writes
> and reads, but never cancels applespi->work.  If a touchpad info
> response scheduled applespi->work just before applespi_drain_reads()
> completed, applespi_worker() can run during or after devres teardown,
> corrupting the device resource list via devm_input_allocate_device() and
> dereferencing freed driver data.
> 
> Cancel applespi->work synchronously after applespi_drain_reads(), once
> no further SPI responses can schedule it.
> 
> Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
> Closes: https://sashiko.dev/#/bug/linux-bb2fd773-6c20-468c-a092-6814f008077f
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/input/keyboard/applespi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index 96c504f28495..d964cd3ee5af 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -1819,6 +1819,7 @@ static void applespi_remove(struct spi_device *spi)
>  	device_wakeup_disable(&spi->dev);
>  
>  	applespi_drain_reads(applespi);
> +	cancel_work_sync(&applespi->work);

Likely should be disable_work_sync() instead.

Thanks.

-- 
Dmitry
