Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158839;
	b=N0yrz1E8196XafL07F2STnCwADaSQHpyEwPZUUbnOKlszFCmsLy4ZdlZdbx9bUDbz+5g
	 yx9Z/QwNFQKbNR+68ZLKIBlmHPwOq6cVjCH1QVGBihtMuE7sgE9aAxCyJajungDhglQwg
	 rInzYdbiIU4TVHyRTzgCziEhWbissnKr6QaBWfsBKt9Wh+reRkQk8+boSAQipgCFd/rqz
	 IdqAdM6BTQsLSiAHQryCbOzJXkAmZgjKHFj7scjaDVLoCnPNarsHxfa2pMq7qAYonX062
	 Px6EqqkhoXcThdl5WIe0NHXHos/qfFFwHRD2ldW1cpo6Kz4C+qwX1bOOVVASp0h1KSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7RB/HtS4S9iiO15BSxD7a7rMqDDbgGDfzBXH6TSb1x8=;
	b=sL/MHZejRhoNFcJepOt659nUutq5wzBE8RsG55nePEeS5cQp9BhNI42YU5OY9Z/S193q
	 8waLEb59EIX+nlpfOCNZm2jktQ93Ab8KX0JxLpU95w6ksNtO4Hi5wrKHTvqfrvaltw92m
	 evDUO7E8/oXgWYMfLbxhynjvRuTeoZAFi8NyxX02srEwFYmeYzKZp7qc1z9tJdT6GfGlN
	 gUbqBGlYY+03shCxMhihnzGYix228DyKUH6No17dQCMtTKUAYerlMWUDOIE9pGiO+g+ma
	 5CMsiyssAZBd650Qb6UbiA8Kgyv3CdzFEN2XVJfwfcE3AAK74sG8jaUA2/jEH31EpKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="StZw2/H6";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2F4606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=StZw2/H6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so5231925e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795158837; x=1795763637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RB/HtS4S9iiO15BSxD7a7rMqDDbgGDfzBXH6TSb1x8=;
        b=StZw2/H6WwnI+YGGuGADmugfPJYA+F8P0w1qgtbquhzPWqUTsPNO2Lw5UnizJ3W4LL
         GAVFXY6w5tO5IasoWvT8Ek00TkkLlNylb95iS4B/3H8nffZ/iaRc5MJsTohqkreKspyv
         W1ECfVESSwtHzdU170+sozSyhPMupwmZF52FffVfyPeGUTKzCzYC8U4RGrUQAqALDrxH
         bEQGQfp/hjiIodKap2dXV6OYiWhBGcdtzz7wiV4InkGeaB/w7OtSDpvx2CcuPDz6t+sm
         BGdMkEzfgaHXVcerhA8FNb/0DeIy/G9P0fgaO72UGUrFNVAw7vT3aHhXLy2ActuWhrVy
         1r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158837; x=1795763637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RB/HtS4S9iiO15BSxD7a7rMqDDbgGDfzBXH6TSb1x8=;
        b=EaQZ8pzBsZJSfRlEdwfb6MKi0E2I2sTvsmL9I4Zyc2onHMOHn4D7cYWt/VHBs5bLG7
         eKFQ/e7sYiT0K4LSbvB/OKIBu+2r3qHF/TDj5oCwOk7TLtYpZrVk0UQZ/jvH5xO8qwOl
         W1p4Nt8UmCw2g0/rdcqIGv4n928sCogfYNQ5tq0M+5lAfAYTBUZ7+NvdNbldpJfqLPiO
         y7ePrLf+o0Po83OXJsBZ47b5jCam6KAOP6gJDgxyEuEo/nAG0Jm7iUrfm3mNC4hHrHx7
         L1UZPuUypBYgL3MDcrGdFpX5kq91rJj5FAmxYypKyHDP3Hxepfie5qZmwSLBIOLA2EgM
         P6AQ==
X-Forwarded-Encrypted: i=1; AL+hErFG4gcQ3h1DKGWSk5xkE00v5/rZu85En2NswVG5/yfjF9XdGRKaQHEdnbaKkZfQ77QQTGBkM1NGqhJQKE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dk7058/xQA/W39WUOJC0QAk6WSQHw3SxnVL6nc91uzQOtYL+r
	czLFlLd56x116z58ngbztL/5gsvcByhTtilsKlUSZXavmxZi44nFGX3WtoCcyAFpRaE=
X-Gm-Gg: AYBFou0GkW88VSUWyt1FW26BUqDmE9fAf+/e0xort1WEMRePnHOduAm7vR6L77sc5Rm
	8a060rZNeDC2ZzPhtA2EQgWL2Ptq/w3juBY0q2GhGIgFKRGr3mw0L5FuTBQwNWPZgNtkeezpkBQ
	G4s+UJ9cR4RN2YpBg3WynNBAA81cx//fWKRjqeNTxbNMjfPxzbx0qmamYzVf8cPnltxISwSt3fn
	zhH2Dgg1cUS2XQN5xdzhkxTA69TnX2munOiURH22LzZ7L+wgfDnWMbH1RdiktNaGGUo6VIpy73Z
	uVk7Jx+oGAhBomov3PNeinaGKVwsxV9ulqBQ6Fz0IJOXn7CYsHrWXtRS9pD9+jSOjoVc6Yq1b3F
	dm5Imlaxof7yhQJTAO7KKANsgOfuxLnCifBBF24NTazTaBSqOzp9+Vh2zljGT2abkK73uiu4rFY
	1ENxglEI6vcl2Y+V7LFELkPO8A+o1/Y6zlT+PAOCXgjHiJtgKTLZEiDiTV5mja/GRX2OC9qvbBK
	6y4onHB9VGIjm+IZB8ZsyzOK7yLuCg8hVBTNOFRa2sDRXbZpqyzsNvUNlnTCSw0TctNi1Hlwpqv
	aJG4fabZ80vJZ4vxafl3SeGXqFNl6jIeLdzyZZZmU+snE66mY9y+987UNWETtAVetwks
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr45264345e9.29.1795158836687;
        Thu, 19 Nov 2026 23:13:56 -0800 (PST)
Received: from ?IPV6:2001:a61:13f5:8201:41d9:56b4:277:abb8? ([2001:a61:13f5:8201:41d9:56b4:277:abb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm3848039f8f.58.2026.11.19.23.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:13:56 -0800 (PST)
Message-ID: <41a997dd-48ab-4635-97b3-f13b11066e2f@suse.com>
Date: Fri, 20 Nov 2026 08:13:55 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: cdc-acm: refuse writes after disconnect
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120070353.956978-1-william@wkennington.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261120070353.956978-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20.11.26 08:03, William A. Kennington III wrote:
> Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
> warning)") stopped clearing acm->dev in acm_disconnect() and replaced
> ACM_READY() with acm->disconnected, but left the write path checking
> !acm->dev and dropped the disconnect check from acm_tty_write_room().
> Because acm_disconnect() frees the write buffers with
> usb_free_coherent() and acm_probe() only pins acm->control, a late
> acm_tty_write() call dereferences freed memory.
> 
> This can happen when a CDC-ACM device disconnects while a file
> descriptor remains open with a line discipline such as mctp-serial
> attached. Hangup closes the line discipline, but a subsequent reopen of
> the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
> c_line before acm_tty_open() fails with -ENODEV. Because the original
> descriptor keeps tty->count non-zero, the reinitialized mctp-serial
> instance stays attached and faults in memcpy() inside acm_tty_write() on
> the freed wb->buf when transmitting.
> 
> Pin acm->data alongside acm->control until acm_port_destruct() so the
> unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> check acm->disconnected at the start of the write_lock critical section,
> report zero room in acm_tty_write_room() once disconnected, and set
> acm->disconnected under write_lock in acm_disconnect() so any concurrent
> writer finishes before the URBs are poisoned and the buffers are freed.
> 
> Fixes: 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep warning)")
> Cc: stable@vger.kernel.org
> Signed-off-by: William A. Kennington III <william@wkennington.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

