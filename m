Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477257;
	b=s0JcyasUmufX1sj8ZZjSIqkdBEWGY6JDynzwsSDM/q5/GDT9QtJlK0euS4+cvuahxy0t
	 FAGTvryed4xf9DPokPMX5MCcymTYasfTxE+SauzOdll4SgmfP9fipEfK6+c+Zxdfv5H01
	 0OCjI+sYZKlWSCNcEaLoA/hTp0LztoXUyKo58fOY4KuGoRihy7b90U5O6KZCwpGerirLC
	 RHAFvQOf3cpQCgH0321el5HTEflQF/PNkXi6I6AnB/xtUhAQJ2GyZ/oYYYxToKUyGMLbF
	 Oc2eFeHz2ouzomd0tZx2+RcbrTN9/166pVyDbDJogQ3sysTPqaxHaasR+9cRdGVvLzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3HojZ9LpVYk+EaEbek6rtnOZZ9lGu8QqE5B+74nGxs0=;
	b=VmUlsssgJyStldk5UUk8AzRug5f2CCrgrmX9w+b286e5oXbchn9mI0F1LkeLvnFUhbVX
	 iA456BHm5tH+br/07BCzXGY5hoFKwx3UTLPoGcLcy3OMgnNo2490/gwy+W56lAA+aU3ru
	 ca3DBv8yUP+SJJc674umBI1pA2AlfIa9DFGXgY3yi/aVUJJQ2u8UjidKQ90tiJzyu/olq
	 KecIJ97ouZt/38MRrSi/bZdYdqtwCZMM0VyEsT8Tk+na+2wg31ggPf/xsh6b/VignM454
	 8LFBSiH85W+j5KyT+d7VOTGvoybrxeVLr6wmQtGq+mhgaoQMheVd/HDqjus91XRiADQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EcJNjE8I;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FCC606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FCC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EcJNjE8I
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3070975a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795477256; x=1796082056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3HojZ9LpVYk+EaEbek6rtnOZZ9lGu8QqE5B+74nGxs0=;
        b=EcJNjE8IXRBcGjKCwKjvUcw5G5Nn7/EynpZU0SjQFHiO89Sd4OWYCmVyI1p8F0KGQn
         Xrzv8zFJAqIundGy0wrWqECU9k3IsGMuOGx0Qjz19NfJlDUDZSMZo8mHAtSqKGTdli8v
         in3WxYmrTe8Um8PiGty5HFQYlBeaJF7g5an4ANNR7jfKn+f8BRLiorqhQB8HJ4yQdPxS
         z3OkFPo/Cqt5v/ZJSGLNfyCvX962guIyxI6zdiHvPHz+ez3JGT8iPudO0cQbOj98N7Mr
         ZQyMbJ2S/t3DHcavl5yL0fmFuXCLcbqHJCOLf8z69uW7O+3zzoPPW+CEGv794UvvOzgK
         HRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477256; x=1796082056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3HojZ9LpVYk+EaEbek6rtnOZZ9lGu8QqE5B+74nGxs0=;
        b=dWjuGtGY7ZnwGvMzClJyFQywxxdfOvzvE3m9PQSls1bd086WtyeRgX0iNwGV5AUi84
         Qign8Eu3yPZsmtNvAsd67eh2fZXpsi8SY0Y6ALLJigpV5B3JT4wLCNPriT++UiRJQmPA
         S41+RPKNKC9LCeEb+6Dl3hRYhDW5eJI/lsyUOBXKfRMsfqGmqZMdP9ndV00PtgXN4FzI
         hdlE8Hi0MDw9WJ21Mn9LLtyhcxLuS2gxGHcq9mGdqOLvRl5Sxw4HxPkP08r5D2s8T5SP
         VkfwGxxpgDcuyyvCuozlBcWlW+n4u9vEc/G2e1emwj5m+LLzz2d0r9qKt0UYRl3PdSRl
         S0Bw==
X-Forwarded-Encrypted: i=1; AL+hErHIKQD3JBt/LeN8EtDpWsDwXyBDprOmUqzoC5xc5kGT7sXaMxmw9jycLb1kOHyZPkfLvhaCup5KyGzZ6GM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8328DP6u59r2aXNQRjRzmmAQ8d6wHQLU2Z7vrNbsAOJpUFDOX9
	9GSZ0+b5hOHqcCTTIpq+LlFufO0rOLF4eYxlw61gnqNDd3EME+CamfnslcYB0tUXAGjSjyDRLHk
	xyjR2
X-Gm-Gg: AZFdTZeilDZwblM0TEcg6iQvNqla0Crpd1bkQw4y4tmKPB7V8LTSZXYdKMd/hnqV6x+
	7s4hZuff6DOUZRjcWmWa4eZNtL2bQDCxZgq126Oi+/vJRIRhlc5p1cDyQLH4PlLOkKc0Tzm9egJ
	XERaL6P+qcb/6OoY+J+hLopjenQ4u+CQwZDm5yBwKiFty5UhPuxqG3+P6FzWOv+g+3GgLbqc0hm
	BCasPLZyBRJN9rHmLHLMrGKJvnwxKFN2mSd0LCmAGWh0VbsgCaqV/BpsS2JvU9S3KeMeyrlsIu5
	5lTilANocowp3ZPOyRRmr+coUDjuIza4+RhR9pFbBOuLBAhSaH7+YwRabJYlstLK0SiHFk4IBNG
	xIw5F92xVpeXontuZ35V+JSWz4bpL3BUab+rEoUyoq4bLQjBig7XEvTlIqbKbCTJfnY4d6pdkU/
	BVOsa4clScudWad/Iuk+JUI9OwcR87uAHCjETCb7JWVjm3HJiksevhV5Aogza7wOiFXXPvThbXx
	CvEFkAC1f7prMAUHHIXeGYvpoyNEfMzyBvRGZYZAbjeuRBGqAmnT3NJ4fImC1bu69U5YxGohXKX
	+sG7lHssm0u6L7bpivmrWdgZ9LWyDVScaAkPcr++Aq1L6H8dzFwE6zqiLwh4VvTKvNQHOVcrHE1
	6B+/F7l/c2Myvq6y3HfvbDjSQgA==
X-Received: by 2002:a17:90b:278c:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b41c97ac3dmr12156450a91.52.1795477256132;
        Mon, 23 Nov 2026 15:40:56 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm20170750a91.9.2026.11.23.15.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:40:55 -0800 (PST)
Date: Tue, 24 Nov 2026 10:40:53 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: dan.callaghan@morsemicro.com, arien.judge@morsemicro.com, 
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	13057616121@163.com
Subject: Re: [PATCH v2 2/2] wifi: mm81x: bound disabled-channel loop to the
 allocated response
Message-ID: <yfxyvklmyq4cglvydogqkoiqsgjvjqy6qhelu2xbxtzgh47zmg@tlfytt2dgncv>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
 <20261120064905.192045-2-guohongyu@cmss.chinamobile.com>
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
In-Reply-To: <20261120064905.192045-2-guohongyu@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 02:49:05PM +0800, guohongyu wrote:
> mm81x_mac_check_fw_disabled_chans() allocates a response buffer sized
> for ARRAY_SIZE(mors_s1ghz_channels) (26) channel entries plus the
> fixed header, but then iterates the entries with the firmware-provided
> count alone:
> 
> 	for (i = 0; i < le32_to_cpu(resp->n_channels); i++) {
> 		struct host_cmd_disabled_channel_entry *entry =
> 			&resp->channels[i];
> 
> n_channels is a __le32 filled by the firmware response and is not
> validated against the buffer size in any way.  A firmware that reports
> more than 26 channels makes the loop read past the end of the
> kzalloc()ed buffer into adjacent heap memory and interpret it as
> channel entries.
> 
> Bound the loop to the number of entries the buffer was actually
> allocated for.
> 
> Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
> Signed-off-by: guohongyu <guohongyu@cmss.chinamobile.com>

Same as other patch, this has been fixed ad130fe51691 ("wifi: mm81x:
validate n_channels in disabled channels response").

pw-bot: rejected
