Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429396;
	b=TM3RY2hR5LSFY6mI3hanMl1hecNHJ8OLuuSBHm7E1F5VUmnwIaAiOcTy7Wu9s0+Ot0jZ
	 klatwizuLDERvIa6/jA2WvteE5zDoivWXV4U/nARyeQ/4zyVhm7oTCa52ET0sEQzdy8nc
	 z/kzzSifKSwUXF67Y05eDcWoaPoM0uibr6fz5fdtXyDCn6LWhVvTWVVWFSe5iNEzhgCTC
	 6ajDwTYU/Qk+uq3UjcfjvIYKi/5MA9gvBv6mtWOwZRCBJeuDLzDXFKcPwqC0UYWLaLmzV
	 UXCc3DkifbzMEOxKHSYUSzYUfXH6xPywMbp17oM4zfgNXYqjHDa4BxmlnlhGUJJ4d0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1MG7opruDk6HGbhLyOi9TXyXBCsTd7Khpfpd5KuFRfw=;
	b=WHYcvW0JQLAz7ztsGvxg3yaZMzvilSj0qPC3EvsLolCQHKTmKGt24JyQontk86Ig7pn6
	 x4y8zw/cb6IKI74zi/gqK/NE+T3onj9CUsw1ik53U7Fn0LgN1w8pZGCV9OwMyoiWIk2S6
	 B/mwZRbcaoAZF0efIltQW2fIPDzjy7D0ZM4bi8/x4KCPW5xKr/Yh+4x1fa7tAIcDc7YNl
	 aVfhiyMQGetV01AS3PgI/3vZf6lKc5D6wWuokWJKVXQkhl09vTsKPBiZfXJ+bROiExPTv
	 zL9EyFy+n9SjlyGsr3F41piVlgacbWi+zJbB2sih8PPJFIN1oKjnmQSqpP2iOc/1Oqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cmEDHLqa;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C91606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C91606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cmEDHLqa
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16853745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795429394; x=1796034194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MG7opruDk6HGbhLyOi9TXyXBCsTd7Khpfpd5KuFRfw=;
        b=cmEDHLqaWYolsqsyPJ6jVl2HyBwR4eOy3PT+08higAX1YYgkcwC062OFRyuyIWXqkX
         t8lH6BuXt3w2QUgepijLAGLr4VkNVcdRKcFL1A0ioX6jMt16yzOcpke/ySd6nWemt2B2
         vO1e7FP9Y3XTcwhFuZaYbvJWBAqMaC3u7qPQYHaV0jRIVXlRLkP340VQm9zPrzQyoLA/
         NTq44exarTHa5EuwRjqhGckyQ1eYGd6V2q8AwlwGmvcUXsibUhH/mCLQS5vLox0CZk8X
         Eqn1SWUa3s8TDegfC2T1SUZ+8sHyMDWXqzgT6Uf6Gh8p5BA4dHMLQ9NjLfDyvardwwkY
         iuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429394; x=1796034194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MG7opruDk6HGbhLyOi9TXyXBCsTd7Khpfpd5KuFRfw=;
        b=H7Z41cBCHy7ADal1SsulXsyZ0TAVvCkufx6iDG5FVN5SMynTw1lzoIjjQiu2WEF+yd
         KYEC48/DuzhcTtjSzGCegzc0ID9u0mv3nXsOcnTqvbc7doAd9CfBBjSB1kGlk3g1Rt/4
         OJqyLd+hPV5/v0h2HrhEktU3C2oSBWKmu0n8FI9h+hamvVZfkLCJNxz5zCjH+xMjD5Qj
         yM//pgn2nTvOpRFhf2A9hdtq8VAjxEJX947OcqQnSnlcT8FSi5s2WPj4x+GWqDP9lsba
         2qc/sBR5tBrScP1KeEU3FImFStl3W8NHruX0nrvXeZTQIObRaFDkBpuQ94PdpRfgNSyD
         OGsw==
X-Forwarded-Encrypted: i=1; AL+hErH4gMT1MMuGl3S0GszRubFWMFA1qJEUWuRwzNMqr7Ehx3IYF7IBXyOIie7uA7lmMU8cLD6NkuOLP8SNuhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yu+GUAGHiwsnDFB2UCIHLUn1FgcsiBu5igp5nJkVhWJOppbFS
	JWXryQdi+i0HwAPGwtzskPBNBq5mBKcSa6MufSM+/jOVV6zfvYiaR+8Tk/TkIvrtuLY=
X-Gm-Gg: AZFdTZfe7Nbqu897RsV0vbMRg2pCQgA7zmQGRT3O1Zo+5WcL5VVLqQEEs17cH9/3+4Z
	ICR58TOEGJDktvxX0mvS4Q5j6L7dmva3xgkxhIg7soulWlfdUefYtJh1orgYpp+vRaRJL9BHhJW
	3uIjEXbYowDOkLpqbgzA34ejHftoDK8syjXhtpSqY2dUhpmWv8jRf2DfqR94tGeYKFgsIDfEsXM
	vsM0cuQaTCWSXyihk312s883hu8fRh5rt7AXwmDC8CMSwhD4XNni8uWyLLGKc0+ugQIO7WDb2sM
	jbNDj2EPkLM6IierNdAZ3BHgxFlF37Sq+kh7+/KNifOB/friRIYDnPYFg6TkslnXBoWXjtYWyyr
	6AA5FowKk0zdYszhJGNmqg6zvazqsmLk6I+pS2Mtm+mKz1fUQfu+uR2ZZvwrrgy3JKHpTM6FPbe
	fy4wqtRzTF149+G2kAwzr/0YHaTHgf4lGLHsfEvmdhtM8PUOKHconRub2XJQGEItA2CAEmVc1HZ
	jW68Reu+fpvHEKrMCVF2D2LjGWgGbqUyqFsurqXSPQK6pLk4pRtyXsvMNiVmxuJzUocvbMVk2sm
	CZbIjsiwOtLr5CLkepAIYXrAGaNe4KN5TUAc4kIafv6mxYMWfzUnwgpc69Bn04gJBlnK8ZBKBMc
	gVWCyX+2XjadJWE6w
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr212081605e9.20.1795429394227;
        Mon, 23 Nov 2026 02:23:14 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm22138236f8f.39.2026.11.23.02.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:23:14 -0800 (PST)
Message-ID: <51674f53-673c-4115-af66-c0fae252fcd3@suse.com>
Date: Mon, 23 Nov 2026 11:23:12 +0100
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
Subject: Re: [PATCH v2] USB: cdc-acm: restore the line coding after a
 reset-resume
To: Piotr Kubik <piotr@kubik.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Francesco Lavra <francescolavra@interfree.it>, stable@vger.kernel.org
References: <20261120171809.1494779-1-piotr@kubik.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261120171809.1494779-1-piotr@kubik.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.26 18:18, Piotr Kubik wrote:

>   /* devices aren't required to support these requests.
> @@ -1739,10 +1749,27 @@ static int acm_resume(struct usb_interface *intf)
>   static int acm_reset_resume(struct usb_interface *intf)
>   {
>   	struct acm *acm = usb_get_intfdata(intf);
> +	bool last;
>   
>   	if (tty_port_initialized(&acm->port))
>   		tty_port_tty_hangup(&acm->port, false);
>   
> +	spin_lock_irq(&acm->write_lock);
> +	last = acm->susp_count == 1;
> +	spin_unlock_irq(&acm->write_lock);
> +
> +	/*
> +	 * The device can lose its line coding, for example when it loses
> +	 * power during system suspend, and acm_tty_set_termios() sends the
> +	 * line coding only when it differs from acm->line. Send it from the
> +	 * last interface to resume, before acm_resume() restarts the URBs.
> +	 * In a runtime resume of the device, an autopm reference here would
> +	 * wait for this resume and never return.
> +	 */
> +	if (last)
> +		__acm_ctrl_msg(acm, USB_CDC_REQ_SET_LINE_CODING, 0,
> +			       &acm->line, sizeof(acm->line));

Thank you, I was a bit premature unfortunately. Could you use
the acm_set_line() macro, so that the driver stays consistent
in that regard?

	Regards
		Oliver

