Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940564;
	b=eDAABSn5t7W2PkZ2jWM9B3s7VX3EtI97gRlh0FDjYtAB0EqgpabScnVTJ2zjIxHQLha1
	 MRyYZQ1yWmmtL6i0moZ+HBFpaOzlzX7fIyVQYveujaTXTDNm2viTvZUb0VkdnMnkTcN+U
	 RRRqmLzTYxxZbDcrm9BKA4hb49GSmnfBj2v1e2ETRQgG17AMH8nSWYG87CI0M+FiDpanu
	 ewvvo23HE8ZroFQy5t2fKmQZT72pNGA5bUFS+q0pvSOtvyM0QY5S2erkzqVM+TaAUdlOp
	 hXoMjnMLkcEa571sGTbU5Tsr7bngFhdNrHywp9djGmwg93YVyqevfh8Aiy7XfuC4bNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rd0/jqMJRNHoYlSsIu6TbBr2fty8j4sVOq9BB4+EiWo=;
	b=ANiyG4wr7/D61nh2ZgaE5ioELp3sbeVIDDJU1hbMLL822Z8xMDkaTqpfmXDk9H2Puj2O
	 HHLpJG4XwxIct+TkreMonP9ypwsxK3xLa7h8M+zszWZ2oT3quF0WoYAjTHR/ZFY6IUJT5
	 nxMgR70B0m3MROs8XDto09UC0Nj9tshRO/WRSl9qpcm+9EskPd3LkGPfZKKJ+Q0Wr7/dO
	 ymPU8BO5DyjZGTP3OV45eE9D5hiouEOFFd/00qHezNOxjt2mvHIIVSm9gpk0G9pIqUVWR
	 l/mtkQQH1TFU/2EggOJttiUTidCygTeB6MjrDcRuvHc/WM8veFx6C852XstMSu7y5YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NY7Dxxv6;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483EE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 483EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NY7Dxxv6
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so239341c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794940563; x=1795545363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rd0/jqMJRNHoYlSsIu6TbBr2fty8j4sVOq9BB4+EiWo=;
        b=NY7Dxxv6aQyYfqSCSaWjfqzlhJ/a0bl+46/lxBlI2EQayiWmonn8eCPcSEZESRGl0F
         O5M4p500Fwjpz7EkNJxewnz1RFnmp2RNQ6T6l3lGogC/6kpQz/SrhY1etzeEU7KoM8VW
         TncEYyGUqKYYcl/u7ZaJkylK4s+Nt4kHmmvGgb6Nra/zO5O2y70qeP3K4xK2/Kt9cKo9
         Bi0FGRThL5Anv71ugGpHxJ0kxJFN5dGESl0yy0qgweB88IJmtB7O992TmZlIxiCvp3GS
         uZ1VgIfPe3oU1M9MuZxrdUZAsf5vEmCymebCYp6MKnqLQVDQNIkJ7vlM3HZF34F7+9b1
         BSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940563; x=1795545363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rd0/jqMJRNHoYlSsIu6TbBr2fty8j4sVOq9BB4+EiWo=;
        b=AsAhNUv16758UOMqIImrdaOzUK132Y2ntuETyqT7k9LOy1Yxh3/vSgfH2BjGaV+xTO
         BK+akUoalOC21u4THjNJNOIgc6Wh/IJz84sLQ+uu33XYzwW+pfaHRF1DSGgWUlnt7ApT
         fvVEPydUNDapCmmD0FysSxMayxzGU4wtPr+LNX5iVjOGvYdYWF3TP6/OeWdB/NSJzK1q
         9/PYsTft8gXgY076pzq82Kjs2JrF6jwzXn6GO2yAQRYbIBRrcXonyikYzTXUBXzXrlgI
         J8ynX2LgIbhan0b1WCyP7HzfmckcAL9h2prmmWgs4am8JnGiEISqVOOF1O+t43es5qau
         NV0w==
X-Forwarded-Encrypted: i=1; AL+hErHRUvwZTJCyB0i/91mvsYTKw5dpTYwHBzhFDEHAYvNmv/FS5Xki17wdHezSo4SoVHKwBeCzP8wW6ZmYYPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WavUmyxwkb8hIsq+44VDtAqRMjAmctsOu8ROY+flSkuvJudEH
	iPP5iXp6g0JuvDjpKI6OJBbvx7LZB6EPJDmFpZMCk8r5a1p45wQ6mWM=
X-Gm-Gg: AYBFou1Sr+Uig0CGX1ytcM77THYDxVT0MkLy0IFpcW+xsnLeumwWphgixkn2KswvM80
	ysun190kJsbn+BiBlJEwNq4eK9x1WPhIs+ZvmovHXG1GLX3tafvK1MTH9HrzJ46oAXql/1hl4tR
	BxS4g3c51e1ZUJeU0ycO1Pqr8HIswMWv6JKC7CFv5NgYD+MCol0HMDhKYqD3ezzlFrGYorXjOZZ
	Apg3UoH5I8rbNHgcyZMgdo5O8U2C26I0WbwsQb5+nV1973sTN+SXfVORnJ1DBiX8+rl9hzv6mGh
	a8CY4c7dIiaOWxu4CQoCLUV1jKazKzdmsf8aSsXEyyy+zTU21LFEgY2xISF+SVg01OVCzcljIkn
	y+lV8cYy3Gt038y6udQ35zdK2sjduyUj47F3UhR8rdm2qce+rt+y8UtN9qgievV2NosUqpjRwtV
	YcyHFoK81TH+abWuixkIR6tMQTgITDEuj8klCqQpzjZE4CpSvIeZGCWyiIqbfTnfr2t6vbaFM+k
	3+Fm2jNHvCuLYSgdNT7AbcY2DjuvpzUra6LF/vFuLKtYyFDGtzFW1xJg5jbOF+flVWNbSNGc7yO
	MetiVYnlKUUhyslre4MO6bi5WOyu1l0wAHhFq8WHlVz8g9f4lk+h7wL9uk8Er7M=
X-Received: by 2002:a05:701b:2409:b0:1b3:b833:6565 with SMTP id a92af1059eb24-1b543cd7213mr469644c88.20.1794940563273;
        Tue, 17 Nov 2026 10:36:03 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.59.94.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm10562926eec.24.2026.11.17.10.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:36:02 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: helgaas@kernel.org
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	christian.koenig@amd.com,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	hansg@kernel.org,
	harry.wentland@amd.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	platform-driver-x86@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	szgit@icloud.com,
	tglx@kernel.org,
	x86@kernel.org,
	yossef.osman@proton.me
Subject: Re: [PATCH v2 02/12] PCI: Disable pcie port on specific amd devices
Date: Tue, 17 Nov 2026 13:35:46 -0500
Message-ID: <20261117183546.1214-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116202343.GA205416@bhelgaas>
References: <20261116202343.GA205416@bhelgaas>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I don't know what's going on here, but it doesn't sound like typical
> PCIe behavior.  If a device is powered off, accesses to it end with
> some kind of PCIe error that is not normally fatal.
> 
> It's basically the same thing that happens when the OS enumerates
> devices by reading the Vendor and Device IDs.  This has to work even
> if there's no device present, which is essentially the same as a
> device being powered off.
> 
> So I'm not in favor of trying to avoid some accesses to devices based
> on DMI checks.  Even if that works, it doesn't cover other paths like
> sysfs.

I agree, this is not standard behaviour, this only happens when we use
GMUX to turn off the rails (which is the thing that causes power savings).

Accessing PCIe space after GMUX has cut power to the rails will cause a
CPU CATERR.

Also i dont really have ideas, im not really familiar with PCI core.
Can you give ideas, you have please?
