Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465359;
	b=CRD3dio/edq7C6/Qffvsjit8xIHhvmR0KDzphfxrgiFkW1zxRiVsly3KA5QHWULkg2Q+
	 JcHb9Czocqqa11NrM9OMCBdFukAgtGQl43vAV1dLJFKPJZnMdZwkDhiV9FkcBH0H1BioN
	 s9+lpGdFgDGUvpGZVkFyv+kgzyWNpl+ZmmKOT+4f7t0cZffYWIlRcs9oUIBSF7ruZ0znM
	 3c4rMnVvQdtomr3vQo1mZkDNfgZm5RoQiNE4sCcE40qo/ohiS1vrMBOgFqxGLdaTxTvF4
	 2DRqRh/fmNtq42IpKD8sqZEzu20TcEuRj/He8mWua2sSOd236SDKpGZTtbZU9w3fbng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gCLRRKTFKXK2HkutDnNQ0o/EWQjNEj+82Vy1QomspIo=;
	b=utQ4pTV3NHpBwTb2jbznwR19et+2YaJQWM+rEUvUi5pO9bzBtXhXCV3UxiXmfBGp/Xtq
	 yNLwfSyIxtb4jf54DzSwGYmD2mKme29E37JFp0UvJ4NSFbWxHQPoMLK2Vya7bctnZ7bXR
	 dxIAYcbuFfZBh4EWVKv/pj7vMOfAoXcfYLd+7OLZHqLySHmxfU359XtIdDIitU2FB5OJx
	 wnnMUwTuzmUi6eHfjNDOJiIQS8wJibI0BfUBhhXjUPtzWfP9hB9hCwpqPyQIeOJyfqWdc
	 WlRCAgkMwZOSHvhFo6aIxKYV0LeMFdBMwab3LT1j7KIAqpqKNladXOJalwdb8ZPGoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ppqht/oh";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D063606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D063606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppqht/oh
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so456646eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465359; x=1796070159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gCLRRKTFKXK2HkutDnNQ0o/EWQjNEj+82Vy1QomspIo=;
        b=ppqht/ohwWl2aULz1yr6gbfVi6RFEHnBDhC+ETkHvKC8uwFFxj3pwj67/MkPMLnmrG
         NQc+56GMEIAKsTSB6tqvcnHnpR8+RqLBG3esAvqmB2z3Qr/GOkV76vRPQq0wdfLTgcEB
         3V0qbatuXHoaxwYxrkidodjS661LvtWMIRO7zbwZy6nckja0r0K25Tr+SiHlDETxpTm1
         HHUPJ54w+YijJDyvsTXu4qNNgHvEmqqDeb4bpiumh/WwXBlM+3PZ/qWaQ9OwEnSxms1v
         J6u7s+jvmvR9CUP3AwZQtUZNHx/NuPXnB+n83AuV6rF4RDD4eqD5OAm3HT2JUgqUAtC6
         +fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465359; x=1796070159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCLRRKTFKXK2HkutDnNQ0o/EWQjNEj+82Vy1QomspIo=;
        b=ovfGhQqr3AJwLVmbh/tN22s9FX8BjJ9st1EW2G9MJazRRMDdvwoIhO4/v0i2ajBDw3
         5AXvFuuonyGImjRl6Tve+Py0Rd2+uXms7n+z28OzIjHDXp6BC9ELRSilvsOnpBbfhrBL
         BOpAwKzYRAd2kCWBvkmWGKQLi7oZxGYziO669xvPiWnTynoOQ5dJU/eJ0OT+RgbwljwR
         lxHTm3BsnIEuJMdflVts9e9gxd/70staUNMWQr457WSqk1AEilyjIKE1WCAoRtHUpX0f
         QyHN7AbmxA5X3wV42WpPTLIvQ+UwtKsOpg3OuQe7F6/SVj2pmHzCVy0fL6kkfuHNDv8v
         BPhg==
X-Forwarded-Encrypted: i=1; AL+hErFTMt0NIEUZHyBrDNw0BWkzvIEAOZ9YhmlETaPolImiz8M/7uNAn/pfXfw56Z66KPr5uQN7kMWvXBflyeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9opslIDbl804iFLNiMB4n7PgctkXhnAj5RHEuJftqK1lHfwjaH
	NFCHRIN631TSnOMJE6hiPPkfrgrzXDIN1F9qYEFMNS2GzkI37rUcnqibTNEXhx6y
X-Gm-Gg: AZFdTZc+ERkJ6A+7OS/IcG6wj/8VUgM1wjFcpsLWsBAFag+EDSOj/1FbV3LqJPUgUOT
	0iioDIHaVsX5WMX50hlnmOoSb+4Y57xngf+BSFzsOSETLZEcN9rSahTZp54Yh13ao70yCPnEEni
	vNaxuyyXS2++OmFe6axQRyzw5+VDHpW1z4VB+m/B1xpKiYQHmFd/Vh76AZRXeYsFS6Txobk7QyF
	3Rj2aUafnsoD57FzEvjTtJO5I+q7FHrl0aRKCZ6AOe5bN3sJyIf4b75oVtsSC3yq16K2xCmxKqG
	YGR8YCC4++BF7b0hAD37t/tXSi8/hKA5ap7LgD3tz8moQNWDXLGWoydLL7gz1C1TBmO9F4wsnLN
	z13ks4iNlOc1rIQd0CjIlTKKarCoDCFgCnFHSEQlqkrtXEGOD1YwI4hQnJpd6URX+yEJOEOztZX
	qURo/WzUyCMqxBzr36RU42Es14OKn655unAgVq/As0I/iS/pXtLUxcqNcu7kKIOVFOlRZc6aB/S
	811Zbh5GaMW4Rh615wXrtzctOPItzMf3mYAJWVgg5cp+wTTZWMPl69LWgIB25quBcRXON3/Manh
	VEVTRT7U2+Z2sOpysckULrAN+2hyyyhULSAQf11mQQd+bCFSfIDkReQ+alhOmLuzawjhcV4=
X-Received: by 2002:a05:7300:b597:b0:386:9e36:df0a with SMTP id 5a478bee46e88-3869e36e011mr13076842eec.13.1795465358637;
        Mon, 23 Nov 2026 12:22:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm32126987eec.25.2026.11.23.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:22:37 -0800 (PST)
Date: Mon, 23 Nov 2026 12:22:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Carlo Caione <carlo@caione.org>, 
	Hans de Goede <hansg@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 07/10] Input: axp20x-pek - skip IRQ handling during sleep
 without input device
Message-ID: <awSgh5DW3V1cLYCa@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-8-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-8-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:13PM +0000, Lee Jones wrote:
> On Cherry Trail systems where an ACPI GPIO button device already handles
> the power button, axp20x_pek_should_register_input() returns false and
> axp20x_pek_probe() skips axp20x_pek_probe_input_device().  This leaves
> axp20x_pek->input NULL and both irq_dbr and irq_dbf zero-initialised.
> 
> axp20x_pek_suspend() and axp20x_pek_resume() nevertheless pass irq_dbf
> and irq_dbr unconditionally to disable_irq(), enable_irq(), and their
> wakeup counterparts, manipulating IRQ 0 (the legacy x86 system timer)
> across suspend and resume.
> 
> Skip interrupt management in axp20x_pek_suspend() and
> axp20x_pek_resume() when no input device was registered.
> 
> Fixes: 8a78050ee257 ("Input: axp20x-pek - revert "always register interrupt handlers" change")
> Closes: https://sashiko.dev/#/bug/linux-5ae6851f-784e-481c-900b-2e1686578c89
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
