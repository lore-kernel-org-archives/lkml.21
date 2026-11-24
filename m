Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494835;
	b=MMAK9Y9Cif5RPHQyasIrM/jcNHOXQ6MxYPR5Wc8fjMp9E+D9VWIpwe4CcalgACzeVaM4
	 WXRyNhXYhRIFKp9xs6xHKr1V5XJvAf7YFqYY7FyLdDHP9rpCyTB8o7asXuntENxjDKIj2
	 p7br4Vng10a3/n2+FIrSl7IWZneMOWJXohaXQuh5qeN7YtFnn4HM7eJTWAKk2sHG8nTH3
	 8fhqZrqh3wMtNl3mdyqcaF5XTSpgncYEiUWtAcL/nZcMK6vQUJry9QhV/2ek4Sx3o/PbD
	 NopJ9QkU4tdbSswBw/+iLYNYrl9geXOWymwJR9sXT5hres2KYYupovy2koiKechrkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NdeN74Wtjt1zICglmVALwnBuGw2TmiMzL+dmKBbx940=;
	b=A83xlv2kgxUcRetz2WHzHsUyVkE3y7cwGyARxrLArph0NWS7CjtAHkIhGRUTHw4zrdDp
	 21tHn5OhkoY4qNEGpb7UyxnFoEqjfYMj11uCl/Mz3d2TztjkixQshIyKpDPNsKxllGwep
	 G0U2wktvvgYJkSSxtK+WfLWkkuzooRgRF4LJHchCpN6OZGJT9pjNgBynavucRbhtesfW0
	 leDDdbCbNbnHSZ5ajGdhGYIdeS6UmWHCFuq0pVTOuiZueA3KLXgOe0ti//l3CDKqGeOry
	 wkZJ3XElvCnyQqtWu4+OAmkF8++/Egr+NCLfsJMpoqVUvhxc29qrfdNQqSlT5US+lkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmCXjJXU;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311F3606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 311F3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmCXjJXU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so10905001eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795494834; x=1796099634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NdeN74Wtjt1zICglmVALwnBuGw2TmiMzL+dmKBbx940=;
        b=wmCXjJXUvwcD7z+suS3yrxGyGzWuDroHMtSouX6nOGtzzH9jFnmlukGW6JKnfgokN7
         7STFd96S//ZdIxLax1dqPQoGoEq03xM2AGKCprp8amCYNEHQr+QvbpuGuEQEeWrr7EAl
         ZDFEeTsfT0OWcOHPDA0oQSs0z17qcPiHo4/+ilpZFYAqPcW0Iv6N00kpEYBKmHu48Z/H
         x5WR1K1xgylmiqvOPOg+DYwQP0KFcAlGO4ieZlVxWOPfehd6C5ielRjirYDN/HI6nnrY
         AQgHxiqwNQ3vOTPX/N9YxqmLj2DpxCM6Uy2ivhv/xLG/TzpzMcSZPcYPKPtaAG8cCL7p
         ElOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494834; x=1796099634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdeN74Wtjt1zICglmVALwnBuGw2TmiMzL+dmKBbx940=;
        b=F9iDr+ZJEcq6/TN7jjpTsnvEZJZFPeERZ0TMEN7gOpwEPsbr930dzC/iaInOmtxnf1
         sgUomDkq7W3+p+Lf9Y2fx6fsEEwmXWErWaw6b9xCNMm2ERNDUOnDw+9A0giaFTMCHwK9
         WszDYp3u/bdKt/CKJV3fNJ7rrtdmXfj0+gvn8KTo/k16wrjeeQ04GLBJeI8m6IlnWzTz
         7rzqsCk18eyEapmulqGD/fNTSUwUo61R1RzhV+j2WKadISDSN2ofj5A2A1OCeRu3rxyG
         CNj3qT2p8lS7lTGNQP0R62vmhy9aqKIwwW3EXRx90nwr83/q76lsYag8mHx1fLDY77Ge
         /dQA==
X-Forwarded-Encrypted: i=1; AL+hErGQ53vC72ynDI0O3veVQTHuNRt74Ymeuzz7SQG0mDptmudH7BpGR9RIYgqhqegwiEdkv1YUbRlZUzIXpCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9OvbsQJhy0WTIQGIumKSY2aAqahLSfOCiWiUqS+FVpZwHVoX6
	TIcY8XWp8QKaiaHWff53o0a6vx78vQbLhc0D6RGjbQFtuxgKSIq/wuah
X-Gm-Gg: AZFdTZcdu4dyvsgmfoE/QNrt4LzG4FUBDWByO5uQyI3pWSc2nhkSIUQLYfU4t71OO29
	WK4vqVMZuFqE9sPBwcosNJRmToOy3RKJ00Ss4eUlFT6c0CbeVdFZ++6yag5pSKjQZv0RnjE5NN9
	gi8M/IeORTpBhj0fpmOcn7wYOJ2/XpSjf/HJI2LwHwGuKmEQYYul67MQKMHVXTI+V3QJ6wItNHl
	6eRou/3GiNUgo7XaflOwnFcPqMaTNsePUgpRGUl3lwxKmz1CWfhA5HFBZUYYXiGOuhSBKrjqB8w
	ANaMzVrWF2rlEp5sXt2rxv9QFFh5eQ/KGqDFOsVN9mjJN33xBc3GlaxV7gaHfKM6TXnlHJlx+S8
	Tjxou8jT7NGLKyHnrcOEDS7CcrJb7Hm/dV8DVgEbHNZBrBcVYcxNN/KEhOs0DFef/KpVQcHj0ck
	Ml0u1EEig8CabDKAksEEBsyT5dVA3AS8d2T7o65FCXAPYbTAkxi9Il+r5b1GnEISQr5IMWGq3kU
	fdhHkJQjKJWCTnHBeH2U2CHMJUlJUqDPTnVgkHrJalqwXRPiFjxpIXIdbHfi1iKDm+9nyYkX2kS
	z5Z8NUVtKPqt5M1M1FbzueC2fhgpWhrm+VvStBSKNeZTxB89UODCT8QB+9d+eXBnW3i+5rTzWwO
	s4gugDyZ2ArWkhss1
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr14810166eec.15.1795494834149;
        Mon, 23 Nov 2026 20:33:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm49123329eec.11.2026.11.23.20.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:33:53 -0800 (PST)
Date: Mon, 23 Nov 2026 20:33:50 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	Andrew Duggan <aduggan@synaptics.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 06/10] Input: synaptics-rmi4 - check for NULL drvdata in
 rmi_set_attn_data()
Message-ID: <awUTq0-QyArghEiT@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-7-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-7-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:12PM +0000, Lee Jones wrote:
> Transport drivers such as hid-rmi remain registered and continue
> delivering attention reports via rmi_set_attn_data() even if the
> physical RMI driver failed to probe rmi_dev or was unbound via sysfs.
> 
> When rmi_dev is unbound, dev_get_drvdata(&rmi_dev->dev) returns NULL and
> rmi_set_attn_data() dereferences drvdata->enabled in interrupt context.
> 
> Check that drvdata is non-NULL before accessing drvdata->enabled,
> matching rmi_process_interrupt_requests(), rmi_driver_suspend(), and
> rmi_driver_resume().
> 
> Fixes: b908d3cd812a ("Input: synaptics-rmi4 - allow to add attention data")
> Closes: https://sashiko.dev/#/bug/linux-0165ea80-0dcb-4d48-96cf-e2c1532199a0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
