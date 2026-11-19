Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048992;
	b=chYtru8/yAxXlL4Rtpx+diZnS8rvrRFbWGdE801X/1qo7RCC7/DmlVKIdGv1T+hctCBC
	 RFQXJDp6LlV7poBdOqqSJZ/zGNhbj9EF8PbTpIiE/gkg7iSM6JoVqMrbqjH+V77sMFRE3
	 3H75PRqofQ6pzcRqqijAe16Qh0XKU8TiL3fW6bKDRcKJvwcg5c61ozgyR1bm++T0cvzXm
	 MtwppxTbGeISUPDfUOnWwmEwOwtxrovQ9WVeXjmG8Ym+UC9yG27BZCBk4yeQB3hrBW0UY
	 rRiNMmWfT86e/DlRQRveHNuHK+2oq+HRqHI6sPgQGfQuxAb83cYuX9UD6XUm2KLEFfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=rXGPcSA1LAN7NCQ0xg//sWiI3uTTDA49S1RmMjXykwc=;
	b=eCwJPVyuDnFeUVBIQZYd+ZFguwjuqJVNIaSd+V2d4T4xCm+b/s933yHvubMUt3sb1/Oo
	 +je4cYssKA8Hjn7k1PMRLPc9pXSbIBhA6peyKFbUNtVBPX5dqNB7TMJ8+GivtxAqBS1JO
	 DCQDeGuRUXWQNYONMLew4tswExdtalIT0N+ET3QdWOKoGgz1thZ3Kw6JrXvmQDSpyfZje
	 Wmj55ULBYk+wuRH4gNsbiEMYqE0eLU76T4K2Hz2KUpWEa7lTpDAYp4G4sQFroF359MEmL
	 /6r6m22IuxtSLQHFHHvKYvBuWD1R9ATi6NOGTo6XWtU69fuhU+iOEUfo6+wAkW/tZ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIPAilQv;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A20606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A20606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIPAilQv
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9e53d011eso13555215ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795048991; x=1795653791; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rXGPcSA1LAN7NCQ0xg//sWiI3uTTDA49S1RmMjXykwc=;
        b=LIPAilQvJZip+dNvCDt+jwWHOxTTJwBxK4WHMwkJtdslpQXa9vKtcLwza0BmGiflCG
         vR7u1/6PSH8ehBRSv/FqNaG3VIbKmkm2umJuQ0NvsDRFELLmSbYniTo4wtGYHjknJMmS
         6rnMkilATkEdzoQ79oSfop9eD+uYyLFOFVZLwY5rjVEuHbMpb7Twl3fGNNQ3Y7NF2AbZ
         RLWK4G/YGruAqz2iGuv79KBz7BCLI7n5BsCNhYqEaVqwOQJQSlF4UuTVh0/LEIRuPmW/
         FRxxDYqR5GwD28lkPzgZCcX8YqlL9ujMEJ7mc27zEwJ5QAZOXFXOgARXjFhN4ipvMOHW
         7xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048991; x=1795653791;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXGPcSA1LAN7NCQ0xg//sWiI3uTTDA49S1RmMjXykwc=;
        b=0nHn3AAMTBflGQfWip1KHgWrbGDdOjOLLnPleLIu3SLG0PMCRbfDfv8MrRI7kcuIon
         G9meI1A6LgBlMsKCzz1tKlpGmIZ2/TDKQyQEB1McQuzTXMBfgz/k03Q3r9Qb+yaI9ttM
         16/s0p0CL+DF10n/rBwHnbb9uAl8ngJNtuw2JUExqxYGI+k5qoEWpOYii3J9pZV0/iHf
         d7PvaSflCdta1RevIOA2Q+TKvKHJEMCLv4yYcfYJNr2rwjCg+22oW1iUys0YoPwuoYVm
         vqq3C72UnwqDRXc6FUQ4SDe8Cml1XbPeMKKad2slm4mt2Yo8AJi4jouzQZHS50ula05w
         zX5w==
X-Forwarded-Encrypted: i=1; AL+hErGsgDrlO4XA1OnJ/JgzWYwi2XN3euJEOZthWTVO6wd5QsRBT2QQlR1ZihAk2P+GdRdIcm9ZHEvSVhWiENo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ozHI7dy0rjTHsqeANVAfsiBBkhlIabHgMdbo0fqSsB36e0Kcc
	hoZ/jRtxc1RuQLmY5/7oO/BsNPZArq/s1RhxF5DM4Uyb2SWDq4w/9iBvAmHFxLp6JA==
X-Gm-Gg: AZFdTZdLzBaT3pPM9wbNoX4sQqkPvWRWiHgktAdG7LspehAl6hXZsfIsYJbEVmdGbm9
	1cmRIASf01NPyDS9TZ4aUQQPG6b6mZaL1JUgM/uJQ7+1cWVhm9b6rZXHvemVPwgcz8wfqc349uq
	eXDHVtC015/7QXsOVVd/OOAO4f5jKsyupYnFYlMok8gklVG58QwG7L9a0jFPN3gXsOZF09V2OFT
	gbWDLJ+sgGkv99bRieA0jUWy16G6GFQuzx0qAmQdHTJSueVEC98txntliG8LYz46XAoAPVvfKYg
	HCoW43mdIQNuuClA9XnWi3mNPM1BJdnvqZoWKRZmGeX9zEqU7iZe1qmNDI8k6ioxOaNHbUBSrIR
	SEOkWy6JRZqNOuSi+EvbsTDuodJtvatbZehEI2A7mCJAbwuBoI2wc26ADwpRTQTBun9CHp54hww
	LD8A+qWyds7+CqJbse3jM1zA/WBYZwHyiQVbfAEZj73arxIeRBbu/pryXpvUPAi7YtXBgoWHwIj
	b+JEP7jirYJwxE3kcwdKfODLqswGxDNP0Sb51TVsAcnvOQmpWNiwzzNuRQDu1BGsMf2SfcNESFP
	NdjQAYkY2vDnt9i5sf7Q9Sa4/8t9n1gaxGYXpEJuPop55H+7TaRI84SaCyUNTNye
X-Received: by 2002:a17:903:a8f:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2eff7525970mr42302875ad.32.1795048989252;
        Wed, 18 Nov 2026 16:43:09 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214cd8sm20785035ad.44.2026.11.18.16.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:43:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 16:43:07 -0800
Message-Id: <DMYRRCPO4FL8.HP2LYDQ286E0@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Josh Hilke" <jrhilke@google.com>, "Alex Williamson" <alex@shazbot.org>
Cc: "David Matlack" <dmatlack@google.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sean Christopherson" <seanjc@google.com>,
 "Vipin Sharma" <vipinsh@google.com>
Subject: Re: [PATCH v8] vfio: selftests: Find devices that have VFIO
 selftest drivers
X-Mailer: aerc 0.21.0
References: <20261118064309.219592-1-jrhilke@google.com>
In-Reply-To: <20261118064309.219592-1-jrhilke@google.com>

On Tue Nov 17, 2026 at 10:43 PM PST, Josh Hilke wrote:
> +# Devices that have a driver in selftests/vfio/lib/drivers.
> +readonly DEVICES=3D(
> +	"8086:0b25,Intel DSA SPR"
> [...]
> +	"15b3:a2df,Mellanox BlueField-4 integrated ConnectX-8"
> +)

This is missing GPUs that are supported by the nv_falcon driver.

I saw in the v7 changelog that you left them out because
nv_falcon_probe() matches on PMC_BOOT_0 rather than PCI ID. But the
first thing nv_falcon_probe() does is check vendor =3D=3D 0x10de and base
class =3D=3D PCI_BASE_CLASS_DISPLAY, and the script can get both of those
from sysfs. And past that, nv_falcon_probe() only rejects GPUs with an
unknown architecture; unverified GPUs are accepted with a "possibly not
supported" message. So matching on vendor and class gets the script
about as close as the driver itself gets.

e.g. something like:

	read -r class < /sys/bus/pci/devices/${bdf}/class
	if [ "${vendor}" =3D "0x10de" ] && [ $((class >> 16)) -eq 3 ]; then
		...
	fi

Also, nv_falcon does not implement send_msi(), so on NVIDIA GPUs the
send_msi tests in vfio_pci_driver_test are skipped and kvm/irq_test
does not run at all. The script should make this clear when it reports
an NVIDIA GPU so users know they're getting reduced coverage.

Since the script can't check the GPU architecture itself, it would also
help to tell the user which architectures nv_falcon supports, so they
can check their GPU themselves. e.g. something like:

  Supported:
    0000:00:04.0 - Intel IOAT SKX [8086:2021]

  Possibly supported (depends on GPU architecture):
    0000:3b:00.0 - NVIDIA GPU [10de:1eb8]

    nv_falcon supports Kepler, Maxwell, Pascal, Volta, Turing, Ampere,
    Ada, and Hopper GPUs. It does not support send_msi().

Please add a comment next to the list of architectures pointing at
nv_gpu_arch_lookup() so the two stay in sync.

I think it's fine to include these GPUs in the -q output. If the GPU
turns out to be unsupported, vfio_pci_driver_test will just skip.

Printing the selftest driver name for each device might also help
here, and would make it easier to tie the list back to lib/drivers/.

> +function vfio_pci_loaded() {
> +	[ -d ${VFIO_PCI_DRIVER} ]
> +}
> +
> +function denylisted() {
> [...]
> +function denylist_enforced() {
> [...]
> +function is_blocked() {

Please consistently use is_*() for functions that check a condition,
e.g. is_vfio_pci_loaded(), is_denylisted(), is_denylist_enforced(), and
is_blocked(). That makes call sites like this one read more clearly:

	if [ "${all}" ] || ! is_blocked ${id}; then

> +	if [ ${#allowed_devices[@]} -gt 0 ]; then
> +		print_allowed_devices "${allowed_devices[@]}"
> +	fi
> +
> +	if [ ${#denylisted_devices[@]} -gt 0 ]; then
> +		print_denylisted_devices "${denylisted_devices[@]}"
> +	fi

nit: When both groups have devices, there's no blank line between the
last "Supported:" entry and the "Unusable ...:" header, which makes the
output harder to scan.
