Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699735;
	b=XnQ6WlW7bNfFfbQPGw3iEK/4TnCW7pnlAQ/kxMLbwEu0ZXfXxg/FFm0NWLTppsvmQRpv
	 36p2wFI0O61mSxRL9l8p3ceDNGXrj6zI4EKEucFdQ60mWqEhEekLEx19gm6r4msCpm5sd
	 9M5VC2iDdXc4nR6RoMSCr3Zhp5+6ybotGwRzzvr/flwefDs2QO0kUN+jf5+2QLVXCIDQX
	 2EL0oEshKXcfpMqEjTZBABVfE7gekeNYu3BhOhzeTG+ri2fmX7beDEHYd4PD4Ww1OY4AS
	 FbhPWcI8wB1tO4b3OEu6OPf8d/HkaVa/Nt2TU9RooFfoftyF/Qb2M30z41+zACLh77w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=khDlV/uVb7yVp3Pf5oNr3rLfI0ItUKfUVqPraLCpERk=;
	b=2oz3Hoj5G/rEmy5wqIuEUoparQMFQSD25baWGSDaaMxl3KQNuaS6O4lLC8s6WIq0Oohc
	 Ir07G36KT5d+OEAqHqJw+xISm198q8pNbSBUIXsxg8COxTNFf4KKBBzSFEFmcTUaw+e1t
	 AGQSGQqkjcwRWFHEBrO5hR+4LWIK60JUIQditRungcZTiE2OnUXqQnKomZ2wrs7hj88cb
	 pXB0mdZ4686pTdMkDZMbCWn6HyJLndHvkvrR2F6AYzc2Pbx/MAzpNZfb6z581z9In15GQ
	 ztNnG2BKkwLWnMsB73ugX1SkFcbixtxfooIOqrBkpU0orpzZMradOkgMcCV10A0sIhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SH44WdX9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D916606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D916606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SH44WdX9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so60171985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699734; x=1796304534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khDlV/uVb7yVp3Pf5oNr3rLfI0ItUKfUVqPraLCpERk=;
        b=SH44WdX92ksXSRH+ab8E2oa08/03RYfoeEv268K13eXX+hq+PjRe96ouXLuBO9hKcE
         TNhcFXICNFW02wGh2k8woc6/qES2xRJ9qAtYUbuuvs3p+vjj3mASqGHYjUqSCJcWZSo1
         A15BMGgb5HDo4nSHEmAEWSnSaFWfx6pQPlPlps6uer5KdJvJjYuWGJnthqjnVBgaXr8W
         WgabKNnixiSPU4wbFskSChCt8R674GfUL1nZzxGi3DreppPRB53Eq/thl5xhzM4HVUBD
         jOhB41iytFgIj8yM0jFnbkK9JGdqrWex8dwdf+KJeNE23DDPxJSn/gAlk2ghkoiqR0bq
         8kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699734; x=1796304534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khDlV/uVb7yVp3Pf5oNr3rLfI0ItUKfUVqPraLCpERk=;
        b=lMXW0NGa5SdvxgZM/wnLZb0BvAZ0uGRjXHAHyg+7OuZvT1akxjr9OEGMrNHwpgl9Ur
         NxmEG7P4CaA/AnJSiUkNYHYJ6Q2CJ/69Xg9DWlaa1LQOxXjnNrSi+U8VP3zym3XSbfMa
         6+0dSwwL8f/5WpIpOckPYeIpO9omH6Y1NtHxK+Eilb3SEPbpaueC0akKbm2+J3jCfj2E
         svzCNsDXZXsCoJUXqo7mZJJ7kI9PHL+4EAuBIBV2YHdUfRgkG3v5MJiArn8A7cj1o7zK
         T3lZFMjif2DocRxZyRXXR6ZBLujz5Gsaa48S1XBo7q8w9hXcqYONvNFxYwqOPMJaAHcd
         SPkw==
X-Forwarded-Encrypted: i=1; AL+hErHCzOJwTXtgYxYjsmw8THTCjAbSlM55ycNy7DW75VyEU6/Rb/aU3kdLEQv2lDo4ntIWIR0g3z5A6D0HlpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQin6wBlepRrVC8hwIwCl9jAuHAELzcuH/mlHyZd56K5lnuk0
	Qwz0QcZpxLrIhQrWus2Z2RBNF3cvaYx3/xLaHMntO6CY06Uje2KU9J7R
X-Gm-Gg: AZFdTZdkIoLBMPxCAYuEjHw6ZAoq+6fQK0av24I/2l/PieOzBLCO85Mz/MgI0yqsbLO
	iOn8RubnoD/zqzfGyJVPyCket0jJKdG+fIkzZRIkFG4j54jhafTfLy6TX5dp9nTxNKLh6azH1ul
	sbomqo2hGsiaGaxIwxQBEVSJv9w8g//ymN/spXoWXdICDNYLBY2/EPpSKy6sfduSXcbiPFCGg7/
	g5yy6RiR4IwbR10jzPgdtBuJ0LNvWNoCDM7wRr3Fsnwb5UIysECV6V2K0QUdkz/RreMrsbzHc9i
	AjT2EalR3LsNL7wTY5EWHbpW/p8TmzM7+Vtx8nzKXRisBnzRPy09MDOC17/iK5RnHj6Qs3Zp1YN
	0Z60pTMJJhdYZfUTWFueab4r3eVvluzEgLgrsG4p3ZCoOY2yBFWt4VtJun+FBmCAqjDZQf/dbIP
	og2F5mTuy+vIGLhRIu8HbduhBw6HRcECfVDEhKoOJov8zALTJKFPVRgqbczTgJfI45NHeQCfvX/
	0a1AsYK2oHzLAMsV1czrfxg1RinzdTlF5jgUxNCfmc3cAtZupeNhtMxfv32qrykd5tMoFYTIjPL
	WZ+2U1KXjo6X8/vsVGkCl3FOlLpo7ILFkdSQA2eWi9YloSwl/ua1GLOF+lqCAK9XL2TqG3MZaSJ
	ipZaG6hSfioMqKj6T/wAUn5MKkMsdfU17R3SprQApTwIR4b4M1yJQFEG4Ntw=
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr414364835e9.8.1795699733503;
        Thu, 26 Nov 2026 05:28:53 -0800 (PST)
Received: from [10.54.182.141] (82-132-213-247.dab.02.net. [82.132.213.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm37152734f8f.23.2026.11.26.05.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:28:52 -0800 (PST)
Message-ID: <11a00d5a-18cc-484c-9861-37fc116f6dbf@gmail.com>
Date: Thu, 26 Nov 2026 13:28:47 +0000
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
Subject: Re: [PATCH] io_uring/bpf-ops: validate loop_step before registration
To: Sechang Lim <rhkrqnwk98@gmail.com>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261119115942.3613868-1-rhkrqnwk98@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 11:59, Sechang Lim wrote:
> A struct_ops map with only ring_fd set leaves loop_step NULL. The
> struct_ops update path skips a zero program fd, and bpf_ring_ops does
> not validate the completed value. Without BPF_F_LINK, the update then
> calls bpf_io_reg(), where io_install_bpf() triggers a kernel warning
> before returning -EINVAL. With BPF_F_LINK, the warning occurs when the
> link is created.
> 
> Validate loop_step before either registration path. Reject an incomplete
> value with -EINVAL so malformed userspace input cannot trigger the
> warning.

Looks good, thanks for the patch.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

