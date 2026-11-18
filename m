Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999759;
	b=PVuNmNajdpeXY7HcqdMjH5T74ZExpe2DBijVpWRX8SeHmfd1uF8B0AkD8gxk/knY062U
	 FXg2U30/UK94ICr9IfRKl27/jturtXTuSriptmRRiIBYbT+T+KwIIZWeDXvIXXfNAWeK4
	 Qs3rGOeyLCqY5sdsAHB18psqRWMX3l/sci2hzqhgf3aTBbFhs4+jUja9XdZP1mTJOznB4
	 HEN+Ag8DVY0LlCo3owAwjRTzgtI6/yyhYL90y2OFIT56Yi18n8lDSwWJZFQV8ABdIh2F6
	 C6FocParN60TfPZ/vGDreBGHHp9k6hnIftSkH86i1SJgEtp1/kMB6G6lBugp+VJrw0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999759;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
	b=QFTXptFdpowcgBRR9ppPMJrY5wR9UdAuEdohxYGgrSsyVT3ni3oxRq4NkrG21b/fnA01
	 Ab6BohLs0cX9Wer7wk+3Rp4q/3kQjEirOtylW9wM3JlB2PD5HO+cO+2acwMlmD5iDCmeP
	 jPeqL2IEDweb2ZyXSXNkmTjl/pOp6RDn5c0sk2j3XOLKYNgrZgcQnNsWMTHaOzuVj9ogy
	 toG4IbgFG8wjNeIP+jPnL0K6GiNPUNRdziEpLUbhahzmWLSHsRsyx3+rqvw37IUj6+iRz
	 xJYQgAyXs/mDhHvKjjVDrDZhWheyckbwe7K5vfHFPCn3gqCbckiKVY8UhXIClHRKjUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CEw7PMfg;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11652606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11652606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CEw7PMfg
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso524310a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999758; x=1795604558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
        b=Drajq+6AFPdSw7vQzCS0rSq9BJOh2DXjREpdIv/6Sm8kbPshEG7/pld08s2X/KLJzm
         L3I5YWtI5M5BZ+GaIoloBaGqLlZ/m2lU0FQJYeMf3DX4QZtoo951GZvH+Y12MR2hNHgk
         2mRxB1Z88OSQaoQfuPHIm6bMLnZOtFzoplM8CdnW+YG/vu72YyZPuXwlbL7m9PJUfvdT
         K9SO27sflhZOJE8eLe3C5oxuGzFNdIsVKuPEgEm3rKpIyB58riBGmu+tpIIeDwWFfM2z
         nkFCuB6Vyq166BkQoVXXaAdpmNQLoQ0MyNHebmWt8HT1tsuKFytlYx6c8jnbwil2mMm3
         mMiQ==
X-Forwarded-Encrypted: i=1; AL+hErFtopAarcmBw0CjgRq5/9UiVqnc9UeRCkrj/sKL4AFrH8x9YSswtu1zZlMwAv9UUErtxdkTXDvMnFOzq6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lcRvMn5ZLF74xvkj6zAO3mOBLgq9pxb+rGxHx6qmPdlwC6mSF
	0LgJta5cOWlK66Bs9hHpjytQ2hDt0lqw4GsZ4jDQIPFhT3JOWBSkg7l3uT9U6oW4eeKTxPUw9Jy
	BPT+TbfyAyGY80hqUvP6NXz77Gu5BGdug/yFxXUG2ljdb7n8lfc4vel7AiWRsXGjHbifCXMIu7t
	2Fa8Lt/I/2mK9wRfAQlCQxjoEKoZ8fD3FnlOpKtg2YEjhrYqCcTUenzAq6aWZ7LsJbnImTFKNen
	/YDuJV/6OLNYJdKqdIh82IaRw==
X-Gm-Gg: AZFdTZeoA+Mk5TeuArnaoACVBI5+NkKlW9bKDH68io0CtL8MVqtsLqj0EAUqSuIWn8/
	gM9wX+9M+hS0WlYCPkXudvGJwZnFV1mFk9+BxGNuarmyDSQghX46Hu/AxrvuARPs6qtwv8jmDOm
	mifHpFsT2IkLVLFvXVmPxBzaGE3ZWr9JLGP08RL2KwPYO4vuKP4VM7nZof5hjhWYfLJk1+kXNO8
	EnS3GNPXI3G8B9SoAQAAAEY14/6YVD04lMNfuqrPtr8tOe4054qSB3N6cwSCH/j+OdsiUWHm58G
	R+klzaJhw5/ufuvxD2QEkspOs0xECc6S3yojDCARKzbOC6+1NOcC38ISuh5pH5HEEa4em+WuQKZ
	QWWnjm9VSKHXyvv5PUJsW+1n04aXJcyOS4lK1Jjpg8d9rqVJWehk2d4MtvO91G+aXecP4GxdVvk
	bbsQJRXKEBWRfIdutaeo4GldqiN4in5NRXYca54Xw=
X-Received: by 2002:a17:90b:3808:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3b3d0764a29mr2574676a91.13.1794999758243;
        Wed, 18 Nov 2026 03:02:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d1d8dc62sm727734a91.1.2026.11.18.03.02.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:02:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-920fb8b9859so19879576d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999757; x=1795604557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0vVjUXXO3H9pY7FsP7IBiUJJTrq9KJzbI8Ty+f7k3k=;
        b=CEw7PMfgdtYDPQpB+ibtcPkFyskPPJenIouEZszsEMfq+0uDoA/cnprYQjHW5awypw
         mQJbSGUW47CnFtpakgNfdJf+H+FO7Mnv37pA6qIQyeQ6CP9nZi8CNgnah3gF/ONQcu0V
         3uEl7wmz9hxz93foYKEHptwPdHfBpV3DLH2Qk=
X-Forwarded-Encrypted: i=1; AL+hErEZC4Yw1Yv11IKv5N8k6EBpQHiWDEWnUzuwNeydpERhJS2PzFw4e1zpWwCHVqR7992Y6SdvmeAS8x6A6IQ=@vger.kernel.org
X-Received: by 2002:a05:6214:3bc1:b0:912:517b:20e2 with SMTP id 6a1803df08f44-92114f76116mr33702756d6.42.1794999756807;
        Wed, 18 Nov 2026 03:02:36 -0800 (PST)
X-Received: by 2002:a05:6214:3bc1:b0:912:517b:20e2 with SMTP id 6a1803df08f44-92114f76116mr33702066d6.42.1794999756158;
        Wed, 18 Nov 2026 03:02:36 -0800 (PST)
Received: from [10.176.2.72] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921167f4725sm14267446d6.44.2026.11.18.03.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:02:35 -0800 (PST)
Message-ID: <bbc2eef7-e2a6-4f26-ae9a-f69caf3378ed@broadcom.com>
Date: Wed, 18 Nov 2026 12:02:35 +0100
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
Subject: Re: [PATCH] wifi: brcmfmac: Replace strlcat() with snprintf() in
 brcmf_fw_alloc_request()
To: Ping-Ke Shih <pkshih@realtek.com>,
 Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "morbo@google.com" <morbo@google.com>, "kees@kernel.org" <kees@kernel.org>,
 "justinstitt@google.com" <justinstitt@google.com>,
 "codemender-patching+linux@google.com" <codemender-patching+linux@google.com>
References: <20261014005553.71803-1-nikitash.mariiaw@gmail.com>
 <20261117133150.817227-1-arend.vanspriel@broadcom.com>
 <670492ee188945f8a3a3b147ae5b840d@realtek.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <670492ee188945f8a3a3b147ae5b840d@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 18/11/2026 03:32, Ping-Ke Shih wrote:
>> The Assisted-by: tag shows this change was produced with an LLM. Please
>> follow the guidelines in Documentation/process/generated-content.rst so
>> it is clear what was tool generated and what tool and/or LLM was used.
> 
> FYI. The Assisted-by is removed by:
> 
> 1e035297ffda ("docs: remove Assisted-by references")

Right. It is however appreciated to be transparent about the use of 
generative tools in commit message and/or change log.

Regards,
Arend

