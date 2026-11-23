Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461639;
	b=QGjVwtoeMTap90roEEizZwyUlFWgScnMdI1Ssv8E4zS6z2dEqLaglk74h8fg589AYm7a
	 EbQmnKQQVrsJOHhKJ3RRXzDctn6N3letmFgIHqcS4E/H3hi1WDI3tMgFl6j5u10bj/9C1
	 EYhFOWw0Oaq+Yvm9KEmwD/N+KjnNlNYHlFkz7OuVUadKWVzIVS6PEYik3cV0K9wOmh6WJ
	 +dg/IohLPXlNEVTPrb443oJSpV3Fty/QUrA8FYKwGqWzU03ZNmH0w4Lf2S6FZND84Adrr
	 /EwsQTwAzY2rO+XdHD0CmxnDfd8b15INJEsUkCEluAP3PHYMrwlYJe8fSLa7ijrjCHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZXQJnKNrm9CNYqDP2KdE9WO17MoeKpLXejbqdj2HY2M=;
	b=l0Ml2dVy6hNGVL55dpO8WfiX/4ppV6nV49OTKsoMLK5BNaWjZDXC3MM2NhvOqCMQbpuF
	 w94Wp7/BhQCEnHQU+anfIhjNA6iPYze3EW7QZQ8cOkTF35m7ctxAan2cVqzHoqQe/HNfm
	 mmcgl8KMvRQa+eiqfFKlMaZW4kjtkOK+AxUd1F4mJPe0QFxvDRKjN10M5s10WBYZ15tuQ
	 ZzLeL/G+Bc+b58WQtApCbO26EDqU2gYhQ5j+dF0GYE/4JRhZQrZU1eoh16OP1fq9W+hWq
	 HEvSBf7BRTGtOy9LcAge0rplR0CrbLDdPCDbTpK/4mZTjU+5GUc9LV4K3L3roDGSXOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAo4LuQs;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD4606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCD4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAo4LuQs
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so29863815e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795461637; x=1796066437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXQJnKNrm9CNYqDP2KdE9WO17MoeKpLXejbqdj2HY2M=;
        b=rAo4LuQsMVKtPy9Yq3r/75gWHb4qfipszW05datgbUdBr5tK/PoDKRjuUfswh1qOMN
         oNEEm178l6auoNzVAuzcTxs3lrxFMUBth1FoC2g8USXhF5yjpfpmyuFNZR9UfNzwSvTf
         2V1g409bmnqs3QsOEsFPGf+X+8IQ8prFM3/OQ4mI7pJ6IkG+Q/Il7soAi9HC+uCS+VXu
         pf/RwnGnd6ejXBI1WsHIpZJDeRc26uaGarbmEA2gYnnliTsqkMxzphwvGeTY/8BE2i3N
         RvbdXrMWt8ybkFR7dddKvLkqmrVZSLEDtkj3ZJeLX9t83p4/EsWCmjtCvxvbku6YRGK2
         LFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461637; x=1796066437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXQJnKNrm9CNYqDP2KdE9WO17MoeKpLXejbqdj2HY2M=;
        b=D/NrHIVBr0kZCS32P7pyjsXRVMkZ/su4bm4Re/4+p1IDnZ+3OVtJOW+Nfnt4Vc28zT
         whVo5dEcu02+Y8OyezQ/Ne5x7CDrvrL/0waB9Pn8bCUCNtms/B5pnwpCPeCYT/Ou85zN
         13LtaJ9K0xZPrsuxla0FVU/tXqd9lIrasU0DhnEn3qPafW74q49giYXTeqe7w/+i1avP
         c2MH+d0t1yMT2AYcJNHiY49O1VGOlwSWa+Sc20luu+BRfpd6Cg9gakC9lMHX7/w9S4AS
         QVTAAD4wpvm8qI8q4EthH++OUTaqZgRoUdDwpV6wxi0Ew9VtmAnpKYB0lq56mbAQszPl
         7gVQ==
X-Forwarded-Encrypted: i=1; AL+hErFmy/mIF4HV1de5u54KOrBXDxWvnGJCTrHo0GfsbAOgV9OdVLrjziww1HvS4wBfcbn1gR1ktfy8MvFBiVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Fe0dkwIKz2dzBFXUeJoIIoqER9b06yL4oAlV7y1rtkIjx5vlP
	P2UljA+RgfKVlW4BOvK31eLSB33xcD/vqC65AqWRzCZTjFSk+p0AvGKr
X-Gm-Gg: AZFdTZeLy55J3cJPFdfv8NGDWdL0tNU39mlnLCQY8cJRyKN/61I5/g8sLG2PcGVszmX
	N/IWiermhit+jBhrdkV0fjGSNADQ3ytegMu/C6gAwBTDvHenJ7m9cRrw51CHTS7ikbUrhm1A+Gv
	RW3SF66iNJPWPAkOBYEDYlDJ6TGUvLXT6tIAWT/A97fy5a0zAfBEayMH5fIlFFZUBKSYoUe74dJ
	/FPdfyX0L3re3XOYo52/ibwoNBZdk0fAZS+jbagEI2W9lCj6ncfuM5ZIoWc+/S6VlCkD6ytcBAx
	s/9FXxZW+uAb2iwvShvZ6DrLYC15uiXgzYGWp5yUziVmencFMOcI738MgUQYfhv7tyhyV9DjFFx
	BejYpBeQMW5EJQIhdubfJFoJt0kmWPSD+/qM2EvsXX//Ge8iY99tL1G4BwNk4t1ry9HY8g0ainM
	M9cT/MAR1YiKCjvH+RMQJ79SkJcDRZ5RPJ+ycFYbfawUb1aO0avVk/mH6U5Jg73LsD1psLEtt1d
	L2rcZFLTg0/iEjery8q23C3EFUklvRp1U9FpDb+aRRZj3bARDX4XTEP0cf5paeWkrgzI8aJFsk0
	63oNZ9JVTfTVF6vN0gIkzpbYBnEE2OrmmAMYvOGWitmWROert3LRSzeXLGKktOupjRAiG6YgU8/
	DEvkq90DJ1PxbBtQCXNfxs86eShaB3Lt2oAPEyBRnk5WrIzYOlrsYU+SHD5nTuUImlS8=
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr286089705e9.9.1795461636822;
        Mon, 23 Nov 2026 11:20:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm403082675e9.8.2026.11.23.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:20:36 -0800 (PST)
Date: Mon, 23 Nov 2026 22:20:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: Add trailing newline to sysfs
 show output
Message-ID: <awSSAAX_x0zj_cCp@stanley.mountain>
References: <20261123191849.232589-1-hmjm081106@gmail.com>
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
In-Reply-To: <20261123191849.232589-1-hmjm081106@gmail.com>

On Mon, Nov 23, 2026 at 01:18:49PM -0600, Hezekiah Mogere Joseph Mayaka wrote:
> The show() functions for the name, vid, pid, intf_id, ip_devices and
> op_devices attributes do not end their output with a newline, so
> reading them with cat leaves the shell prompt on the same line.
> checkpatch.pl warns about this:
> 
>   WARNING: return sysfs_emit(...) formats should include a terminating newline
> 
> Add the missing newline, matching the other greybus sysfs attributes.
> 
> Signed-off-by: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
> ---

You can't change UAPI unless you can test the actual user space.  Sorry!

regards,
dan carpenter

