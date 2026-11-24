Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544553;
	b=M1U8LB6Tj+aEvA/l/ZC0gYFkt+qd9zqylUEGgeDjbxwNmPfYrBTkvEagyj+nZO4KW48A
	 APOAX+noMMHN2UbbwSHesgw0n53FaVJjnk1KR+7QyiDzF+vDSJyx1f7Q2qP00Y8dhkwN7
	 iKWw+D8Y0CU4ONQ8rsjRfxhtNDugTSC4+jwDW7AY9cSnzgigf+nZXYfuLDvr0Fc3Mfx8s
	 lXhzYTxJdPWCpRAxdrB3rtaT8WYt/q+NmyhR3iKeJg+6JXlt6qmYG3bChzOq/AGYt7Eea
	 JbTZr+Rr9ulZeYhQmXuzWB6IdmEvS156Y5Bff3r6qAeHyIUa05LZ9HhOisVEmGCxzkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
	b=mhcJhp+cwQZzdetI97mABDzmLoYV3fNTFWX76i+AradEYS61HThEso50Qf0+e8niD3RP
	 uy/BMDMVmynKO2Yt54KHzPL15I0wKutky7ZPnW1YwKLEj/ndvwyYU2ABzpQ62Qe2GM8ZY
	 LchuUbTCBKdoYAMeoa7528m0Xj2v5zFwxb1PEjL3XQtdsXnxCFmhBO+kr4E6EuuICtqAJ
	 xpaMEVZrdgsBlaIwNPk199Jes3ypLBnPQMZRiZlRQIRhYSo/t63BDkAx8n8+B78JrzX3B
	 GpTMbVkpD1z3VWiQc8p0LaEBwKk6iht1x3AlU5v8yNDWLPT8x7FNqVmQjAPNWl47qCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DNLYG8o/";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24056606A339
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24056606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNLYG8o/
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b563e32936so1114267c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544550; x=1796149350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
        b=DNLYG8o/Q8J5WqPu8p+NIGocgHhg9M/LFdO8BOGqgl1n/72wXjyZnjaLhhCU8ExAz1
         KeYhD+Twn0WgTQj27WqyG9OIX4vixtNxcf2dJcr+OzSbSWdq9LQothnAIqyoE562KWN/
         8S5gHRbSkcCXHq4OVuddS4r1yu3OLRBNcALHpu1u8VehpsDAJkQaaC+Bvf4rnqg5yIVj
         Mo5+pWPeEgpg0khVaV/Jp+97+MenSYsgHYRZjkV2akYETyq4EQTynIl+zAe/F5vzGX0T
         8chHQs7BFv8I5KdJ2JWzpBjR9M42ghq5QrkOxWwikZwEOZ6Kj4k7asjiyd6eyvuX4vnj
         LGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544550; x=1796149350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
        b=C785bTkx6xQvKLzeQ5dSpNk+smXTqLTlezeGakDqKU9fnuKZ1YIGWfLPWQKS8W+CHh
         4rf3udcNN5a55IIUnq9cTULU5UvVOq3Xln/wnCWn+XnjJIpb2/mfFnd2IWwCd2/4n+gn
         EiPZCdcV0xfcoln6+0K5NH8HgyIegBQ2YznQMAoBdPVAFsjRYrXm8aQVsHtMpP41pxZ7
         ChOaTX2JrXBmBek7QslkZMUDwvAPUYjQUyQ+iWOWqgX4jzIPglR67mvwWq8WpyqRGmCf
         Tt8XyCnXcwbuNc2N4rs8JxcYu5d74RGgaXoaCG3LGdQRxc+qHxyy2YPrMfYx1LhBbrO2
         XqoQ==
X-Forwarded-Encrypted: i=1; AL+hErGepTtXEmkbAywJzaM0JYAchGpf+rStSTZGPIksup+/a14xLPvYJ+i2V+7g2e1zmYzgHV2FTclNHLnfbQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z91BhvDrAfk2LEvfZk7xkpHr9+9D5mK9yxz11f6TaLxMs0XvXBy
	VEWW+49d2LaNhHD9M+J0KtdVwpdfylyhZCQYTWbpwOT0VjLqx0zgMRxl
X-Gm-Gg: AZFdTZfuHv1gviun9+jh0bJMq+rZiEtSXJlNYB2OI8tt4RSR0BLhBxiXX1JzwAOtkpF
	7I0Rz0irhGFO8v9y0cYWbVI9oZJfwdq5NCqlbO/za8XmL9p0wWVM2hktUh+AFcC+e4GHsuo5Vs0
	JdXJBT9o+JL2Vq5nX9XTrAl6GsiNVCuGglRjEepad0BhfQhm2/ZNshbkIpma3ey5p0EnJdtFRfe
	Wl4axmpE8OTlWwUK38U8KVlYhlUa4QL1uYgGOO2tiySyDMmvbaP1Zt8HnphuKJWHlqFjcvVv42y
	fSdYEZbDHddbGpOx6UDdgAVtD258taGEcIlokHib1VGP35B8OB51BFPKHr9giYbVG6ASSGaytaY
	tGCvz3FEtlfEvOSvFQVWo+jbdWL6FhyOm9M+8R/JS775EIF/reRVDwwJMzBWAeWjAPA+ZfjFbSE
	PpDQaxxHTo1SD/3PHuFg+Z4Fnyr4qu8BALuSznWle7HnayBcc+JsGVMOq8UgxhfybjsyXRYGMNl
	FMOnVC47XD+8p2w3AMIrQgdAzoqcd2MpvntYd6E5Mgi8nDnYg76sSe62qb6uaG2qMc1IudTuFGs
	Q4zBzgxJMlbCCw9i5eLhyQH85mZPlxUPISazAXwPPyHq5mPjShxWzOjgEor7DcLEOY0wIfFaYd4
	9k+gE6qu+GX6t3/oeyg==
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr20326331c88.38.1795544549929;
        Tue, 24 Nov 2026 10:22:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm40472836c88.6.2026.11.24.10.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:22:27 -0800 (PST)
Date: Tue, 24 Nov 2026 10:22:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] Input: goodix - sync the irq controller while
 starting firmware
Message-ID: <awXV3Y080rMLw_VO@google.com>
References: <20261124085058.128173-1-l.scorcia@gmail.com>
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
In-Reply-To: <20261124085058.128173-1-l.scorcia@gmail.com>

On Tue, Nov 24, 2026 at 09:46:22AM +0100, Luca Leonardo Scorcia wrote:
> On the Lenovo Tab E7 (TB-7104F), which has a Goodix GT-912 touch screen,
> the touch screen fails to come online after loading firmware, printing
> the error "Error reading 1 bytes from 0x8041: -6".
> 
> Comparing the upstream code with the Android stock sources, the existing
> call to goodix_int_sync should be moved between the upload of the firmware
> and the watchdog restart. With this change the touchscreen is correctly
> detected and working.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied, thank you.

-- 
Dmitry
