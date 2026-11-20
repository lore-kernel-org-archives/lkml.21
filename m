Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188514;
	b=UErDTgiwxhCE4Cn1KqJ1Z/EFLSRGQa8TYzw59xEc+++wHsJLUCXUeWPG8MMEqe69lzj3
	 DXt0AN97zwOB8iY2oxbu53oocs3+jL1ypahxTQrHJWAN7+5eILqdRWs0I2b1mM+BL6AL4
	 Z/AS/gVif5yZ9i7ELOlch/sohMan3gKl+oL6x9JIPoziM8OVNPP2GsJ+PiLx14XasfOhi
	 eN6U6yQQnNafyB9OVR6CkJG1eztB+RRaKoMOJYm/1FpNB8YFGZa/kPhQuvNc8fM/5Nq4W
	 SJNtN/L62Sa7NdCSabyvlVec4XnxexrhkKZPOkPwXO5sZSHhGC5CHLhLtTpECHWZn1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188514;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zL2uwwgfk8i7RgCoE5FcFfUq5QLlEXIJG136T9/1M30=;
	b=CLCQOw11B4h4zqmNB71mOjMvBpfigHvxpdwtYRXg82wut4yLiWrxOqbkQuHYhpkQUf+O
	 EOV98tdwZZM5FqVGV/gEBYRWStt5aZeda+iQSFiYc1tKKtNa5F4gMqgkU1c0MD5TvZZUB
	 3e9yvApoesd8d6zt1xTIK6KrZM89oNJd+rOFIk55RPq39D8avmxndnQ/QidwjrWMrdWeQ
	 6zO+0bICdpBCMR7HzwrcjKreCpHcP0Bv4tK+KfLZClLvDnYpnx3oGbDdPCfTPOcGh7zhw
	 0Og5rJHtGB8TjcgZhsSInBDma/IBPlGUJetcwZb8ZNlK0LudUBkoTusllshd6+l1RkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8UNnQWs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DAC606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8UNnQWs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C1B1F00A19;
	Fri, 20 Nov 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188513;
	bh=zL2uwwgfk8i7RgCoE5FcFfUq5QLlEXIJG136T9/1M30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i8UNnQWsrlA1p3mv4luD04DtjjOOxq2L1sxmYNsgKJDOZ8C0Ty4Gm2D0cSyw6Iueb
	 559zgsEGLPuOcXyRIEePeZeXS/h5M6gujntZKtLX629fDohTWEKN67CSQB/9f3iVKD
	 7iHTTfb+WEZyeea+V0NyLSDOgMugIablUc15iDoRvRsms4IBTK6ydxyQN7k7Db62LD
	 AYSUAAN4flQW9l4gTmMMKFZa+glJdbfekaiu6r9MwFlDLcrA5h3xYEfnc3f8XlvPcC
	 unTfz8NOCRYARdDOfbbYWXm+AtYoxLe5F3g+ohO9kA5S2E/UsZWTZRWu6LClULYAOT
	 1XJnTj65d0fLQ==
Message-ID: <59b8e9df-0f78-49eb-a23a-2b352a4a2333@kernel.org>
Date: Fri, 20 Nov 2026 16:28:19 +0100
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
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
To: Wadim Egorov <w.egorov@phytec.de>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, alexander.sverdlin@siemens.com,
 jan.kiszka@siemens.com, ayush@beagleboard.org, robertcnelson@gmail.com,
 upstream@lists.phytec.de, francesco.dolcini@toradex.com,
 leonardo.costa@toradex.com, matthias.schiffer@ew.tq-group.com,
 stefano.r@variscite.com, eblanc@baylibre.com, msp@baylibre.com,
 thomas.richard@bootlin.com, miquel.raynal@bootlin.com, mwalle@kernel.org
References: <20260910134409.1713610-1-nm@ti.com>
 <53d50a7c-4318-4705-ae21-780b04628742@phytec.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <53d50a7c-4318-4705-ae21-780b04628742@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2026 15:42, Wadim Egorov wrote:
> 
> 
> On 9/10/26 4:44 PM, Nishanth Menon wrote:
>> Now that all relevant drivers have are ready, convert the
>> TISCI drivers to modules. This impacts all K3 platforms for
>> boot, recommendation (based on empirical evidence) is to use
>> deferred_probe_timeout=60 in kernel command line to allow for driver
>> probes to complete successfully based on the initrd used.
>>
>> NET Savings: (Ubuntu Clang 23.0.0)
>> ./scripts/bloat-o-meter vmlinux_previous vmlinux
>> add/remove: 4/380 grow/shrink: 0/5 up/down: 32/-143248 (-143216)
>>
>> Signed-off-by: Nishanth Menon <nm@ti.com>
>> ---
>>
>> NOTE:
>> a) This patch is based off v7.3-rc1 and will create a merge conflict
>>   in linux-next (next-20260909), but the resolution is trivial (vs
>>   bd94bea7165be450903c6d64bbcb4862e36798f9).
>> b) Emperical experiments that Siddharth Vadapalli did,
>>   it seems like some driver probes might be taking much
>>   longer than the default deferred_probe_timeout of 10
>>   seconds that is used when CONFIG_MODULES=y. Testing log[1]
>>   a deferred_probe_timeout=60 seems to have worked fine.
>> c) Full bloatometer report is available in [1] as well.
>> d) related lore discussions[2]
>>
>> [1] https://gist.github.com/nmenon/5f1587b373e6ca27170593010188d968
>> [2] https://lore.kernel.org/all/20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com/
>>     See headsup I gave on #linux-ti irc channel https://libera.catirclogs.org/linux-ti/2026-05-20
>>     https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
>>     (original thread that triggered various changes)
> 
> I can't boot our boards anymore using the default defconfig. Is this forcing us to switch to an initramfs?

arm64 targets long time ago were supposed to use initramfs. It's pretty
easy to switch, honestly, yocto can give you a very small initramfs
which will you can also extend to copy the modules to rootfs, if needed.

Best regards,
Krzysztof
