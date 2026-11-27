Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746268;
	b=mAtnbziGZGv+Nzlvz4T70vz1zAC67Kjr2gfANclfEqeQn54quw2nCg3rzWhGFe592VYg
	 oGXeBfMPsvT40FYjzmCSYHfdsYL8XzJ77ruY3y3ErTVZ8MxU/cr/J5Jno57pz6OYBIOXA
	 zH74Jn+A53WZdVS4WKzMlMKYEPpTRsgycEOXKcSyYT9pXJfyNBcuaeavg7gBPENTkPwWW
	 iLCkbrGiwVVe4IkP2mWFwyN8IwB7CG7RppRi6mk1DrfeJxU0wuJeGAqUIzVSwvB/EU80c
	 WpmhmrEtnoGAnu4nRwXrsXi12gE9WHKBn2YnbMbdVNXAM60PlsDwTra9i4yL2TjtUXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746268;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9Pj+rgH0SFfagaekBhT1Ylt9JHHzTYBZguiWaQ+YrK4=;
	b=AVPQ+OoIhcq1Y0K8fvrDSsulo8YddonZKC0nkvbiQZGrVFvq84LmZhKEkR9vpNAllo97
	 fGVJaUDwb6pWCrG9PeuP7w7qyPjlyHYWhq2fK0yBYklJnE6FgkvJNaf0QK93+t1qfvScf
	 LfIX3R7shfWD+daWuVByg2T9HONYM1wPjzZ9/WBMsAvNdnx9S21MALGDOr+F9SiA71fjO
	 0fO9/PD7/SYhBRBExCl8Dh751ChP4AtQP8gkjuf5HDHatzmx1NmHxoxC6iijdIrdAqIEd
	 Iqm5UUH55QhnV7gqi6Bc8KheYeGX+MhLwQGzVp/P6xhg7pRsQdPStATsYcc0nfwymog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CPHM0pXy;
	arc=none smtp.remote-ip=95.215.58.33
Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A11AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CPHM0pXy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WiLvzr5y5MgyNZzGXOtZxkxKygHCxCkqgfrX6CUoptw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795746265; v=1; x=1796351065;
 b=CPHM0pXyLrYKh5saCGlnsx5mjVOURfXKxPWBo+ncajpUyrFdh+5DJbK/d/iEhHB0YhrOX3xL
 rd/7XMlCP7HGryCFwPEYaxUi9mLZVS9WmAjIF+A6mPR0UDecLtqn3OfyQIoVbJijGalLRIej3CG
 5iHpldNcF1nwKv6Olc6V5vvE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 750dd8ef9f9ca9df;
	Fri, 27 Nov 2026 02:24:25 +0000
X-Mizu-Trace-ID: 750dd8ef9f9ca9df
X-Migadu-Flow: FLOW_OUT
Message-ID: <9d749653-e1f7-4290-a043-c7458c888c9f@linux.dev>
Date: Fri, 27 Nov 2026 03:24:24 +0100
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
Subject: Re: [PATCH v2] MAINTAINERS: Add Ahmed Yaseen as co-maintainer for
 ASUS notebooks
To: Ahmed Yaseen <yaseen@ghoul.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: "Luke D. Jones" <luke@ljones.dev>,
 Corentin Chary <corentin.chary@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261126-asus-armoury-maintainer-v2-1-2091821519e7@ghoul.dev>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261126-asus-armoury-maintainer-v2-1-2091821519e7@ghoul.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/25/26 20:53, Ahmed Yaseen wrote:
> Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
> DRIVERS" as privately discussed with Denis Benato.

Hi all,

I have no idea if Reviewed-by is appropriate here.

Anyway the gist is he's tha one that has worked on
this driver the most (especially with fans), so: yes,
thank you!

> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
> Changes in v2:
> - Use "Ahmed Yaseen", matching my previous submissions
> - Link to v1: https://patch.msgid.link/20261125-asus-armoury-maintainer-v1-1-053e67858be4@ghoul.dev
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba7650cb86b0..c47b29d15d15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4223,6 +4223,7 @@ ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  M:	Luke D. Jones <luke@ljones.dev>
>  M:	Denis Benato <denis.benato@linux.dev>
> +M:	Ahmed Yaseen <yaseen@ghoul.dev>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  W:	https://asus-linux.org/
>
> ---
> base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
> change-id: 20261125-asus-armoury-maintainer-59689b2f2db2
>
> Best regards,
> --  
> Ahmed Yaseen <yaseen@ghoul.dev>
>
>
