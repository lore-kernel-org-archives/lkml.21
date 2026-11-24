Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551237;
	b=bh8NF/P+WSw+1/fWXsHTnvXueMuoMPq6NOdSAKEQ7Bu53iz5LmPY/WhNXV6hBmSoGX+k
	 Jp6XcqDe0LmEqSMUvNF5PI4+CEyFYc6FTJkMX+wEh/gUEheQJFFrrgdPWfeRIgspH1vI4
	 SpNiRL9V6J/uVMxhCFuzu5DEO5PZMckM4ZHF4Yt7SVbovj9Ok5vqsadMNVUP6+rCstHPH
	 1MF9ptEOVJs+H9iIl76AZPje19VOfa2ltaJ8N7XPso04FaR/3KqyBB+N9+5jYBMqdokQx
	 WbcyLXG9kQTfmKvDnbs6Y3seB9xqYWozEA/rjbxSVEjGvoHlumRX/Y8KzDLSBo53vJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551237;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
	b=hU74ybuLs+cZJegL+jIh54nLTNt2VqJyeoE3c5gVRTuqJT6zMasKwuoILhhDAAnBXKdc
	 soXMUwvPKkRiK04Yp9/1KX+kG5qRlP04DOA0Uzmeq8lW0c5bfYzWAsF1shk1UYAX26IYz
	 nuvZXuRPIb7cZYGxl3XXFknIngfPNs2AfjeZKOXpM0kXwtcy95lNsrXLflR7SGnnJhUME
	 oj8gDkIO9mIRMOoCCGaIAv2gf32KiOWMUifgjFzouvCsO1LbUyR3gDCmWpyNazH0aK0rH
	 Yc6xzipNJCb6TXbQ5JasWTMHLKZo6OkUDiR8XLFxPiMeLt9u1gM8zfZv3doXJs+kFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F2SWJf9P;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01EA606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01EA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F2SWJf9P
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso10601970eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551236; x=1796156036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
        b=FyepxMA/INLOOHhA9B5UBq50tLWFkR4Gi5Z4uepHT6HE6h1SRbAmkAvpWbAIqURlLJ
         HmbzL8001xZ2LsOm1DSE6zJ/4hQA7dv9nlciwm7AXqZutLxQXkB4Z/Pfec2KGsBtu7/e
         ItFcDAl4Xn9L7nWx+eVcHNNDqxgz6e6rcCmYMHHi1pZGWubosbtTKHt5Dg9QJEWFlkS7
         7d8wr6htYgWlypBzIb0qiX6PEMEU9J54yR1ObSVluD0OKFb9nKdYsjpwE3QeLLi/SM3D
         25CV3hLDDGkNfjdDiLeJWHv/o4lhyv/JT7epxVdYI6eQNDdLkZAPLoKecKhnaskKGeo6
         zJ5g==
X-Forwarded-Encrypted: i=1; AL+hErGKK6a7j5WHrf+gtYLeaMJ+R7iejLtFg6YbiUfVgSLRuE3e4lRCH8p3N8mEJRy6rIyvdFQ42a6RV16Wmno=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MMUeorDNZ/CJsAPYBqoxta991RpKfFy2ShVmmy+Xme2ySD4+u
	lMrb2wi6kIE0jMTUPtRsDm4r/KUrfUujUNfzJcDFaibaOBeJaIDnABSpQBGaX2ldUqCfV8vzWrU
	jqvkzC4Xw6HP0ReZ5xlkwi/E6VTb5EO0dTRGXIhBdYNGZMCpYSgQYM1jP2luLN3M44q08DYV4nO
	opbXpFNHc7EYH6h/ejVJI++uWyuDyyrM4Q4CTPoUyZcmEqD3uuFXT19fxr8S6wu2N+CIN0SZ4oG
	ehvkZVCz3hdvFmBNLjFZbAWbQ==
X-Gm-Gg: AZFdTZckTVzY2zeghs9Os/n6Pv7///yfjVG88qJFOET0R4oO5vQa2sB/6l2pUJjEx/S
	4Xde3ddaxgl7AcVtTq7FlrceIPgO+FqEf0DSm44ACDAoC5tz5hipXH01ub1E+kSkD9xlZUvy+Kk
	GKcD2kHZ3XVPXvBkT8CsLEIaQoRtZ+i+jbv8mcA8wzsbKLuYFaThTOs2KR5lTow+qjvuTUqHzBN
	+d4AzpryoqhUb+t1NyM/k3byBjjDoWZExYRExa8pWWtvHzeRajiol4vV+w/519p58huyao9ZyOV
	CnwTSs8cdMh+c4Peb+0nzA4+V9S9JFNgEMyWSqGBdCEj9fOuneuyIcxC3ZqeG8hdIn7DUL9rONB
	q/iCxs5VMWxoKA1tttahAuPEYxsDwdQMorFiGjZPpMdU2wJanWKZj+oyE/ajy+J5LD94yw247OW
	rnsAfBO3/WeObrcWmLGr8NZK4js408CE0+QqEPTFr5Vw==
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr12604089eec.20.1795551235603;
        Tue, 24 Nov 2026 12:13:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386b1965be3sm1218900eec.2.2026.11.24.12.13.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso711731085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551234; x=1796156034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
        b=F2SWJf9PqOmIVjrduE300d7rNnhvWlk+gZC751axjduniQ6Mcy5E8WFcE8sc23gzFt
         dzBdR5GXjHQr+jwQ2ILvjkgCkjxHT8D7GxG9kn9+RdP6+Pw5I4vn3QWr3LEnd+tDDAcU
         JMCLAa7FU9rDO49wzdGg8ac//4ysx7+Of5cdo=
X-Forwarded-Encrypted: i=1; AL+hErFVVldg+sUdWp8r6E13iCOT5rHwlFCUbBvX1Lw3uaev1/FwZ5SJZ0eQEHJqVc7x5abzWjIE+nCG3YasK4M=@vger.kernel.org
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr2711119285a.34.1795551234344;
        Tue, 24 Nov 2026 12:13:54 -0800 (PST)
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr2711111885a.34.1795551233648;
        Tue, 24 Nov 2026 12:13:53 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm1133479485a.30.2026.11.24.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:53 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Chad Aldreda <ca@modelmiser.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: fix join parameter length in IBSS join
Date: Tue, 24 Nov 2026 21:13:50 +0100
Message-ID: <20261124201350.3495772-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121092746.2917397-2-ca@modelmiser.com>
References: <20261121092746.2917397-2-ca@modelmiser.com>
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

On Sat, 21 Nov 2026 09:27:54 +0000, Chad Aldreda <ca@modelmiser.com> wrote:
> brcmf_cfg80211_join_ibss() builds the length of the SET_SSID payload in
> steps. It starts with the SSID record (36 bytes), adds
> BRCMF_ASSOC_PARAMS_FIXED_SIZE (14) when a BSSID is given, and adds
> sizeof(join_params.params_le) (16) when the channel is fixed. With both a
> BSSID and a fixed channel the result is 66, but struct brcmf_join_params
> is 52 bytes (sizes as on x86-64, where __le32 is 4-byte aligned). The
> length is passed unchanged to the protocol layer, which copies that many
> bytes from the on-stack record (brcmf_proto_bcdc_msg(),
> brcmf_msgbuf_tx_ioctl()), so 14 bytes of kernel stack beyond it are sent
> to the firmware.
>
> When the channel is fixed the whole record is in use whether or not a
> BSSID was given, so set the length to sizeof(join_params) in that branch.
> The other three cases (36, 50 and 52 bytes) are unchanged.
>
> The double count dates from the commit that added this calculation: the
> BSSID case counted WL_ASSOC_PARAMS_FIXED_SIZE, and the existing
> wl_ch_to_chanspec(), which that commit called after the BSSID case,
> added WL_ASSOC_PARAMS_FIXED_SIZE plus one chanspec again.
>
> Fixes: 69274f020a92 ("staging: brcm80211: Fixed ibss join/leave functionality in brcmfmac driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
> ---

[...]

>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
