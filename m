Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534696;
	b=aBan2wJsGiSgF6T8wQnEhM2LpJO47nlzKUdtCJhSsU6aa7g6D6DloV2Z7Wc6Oe1t4Z4o
	 sdI/FiZoBMYNVNxMDH4rgrgvls63EUFDHSOe/3mgkEJ8O71c4D+GzVlWkov7y7aoC3NKt
	 ojEm2tfkf2m9hfBOVX75XAO3iliMX3ykWeTbDj2MWbWy7WmxUXkjVicMnzu0jjrX8I5KE
	 v7Ypdqdm+Aa6XktQvnmElj9F1EY9Mkcwy81hWJex/cuLjpXfgMM/F/fXOK0dRNC/A1K6z
	 9ZRhGDTbleeG0eM0ICVMX0pxZZ5rfeDMzyTXH8GYxujkyJcp20ds/Uwilm5XUzuQuTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534696;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Qd4cLEjyU8p1fwdfC/RYTseQimM3+mbqD8vsSZXiXHU=;
	b=zjiq+S1xKHZRw3Pv9lqDBkNnZ7SXxPz8h8tAzh/AC4CFjmzDjvGPtLEWny4cw+EKuO7S
	 gddyXHSuM+wH3kYjqLUhZ3mSuftmg8JbI+MUS/PExEZNgb2F9CzRHHkGiQagkGpkqQ7Ry
	 8sBE4mj5CeRyn58Na3r/dmXzEYwSmgvNEQ4hf+UQRy0Oo4lXJWJvEAdnm6vL+DxaKdkD3
	 sA4mug1Xg2wPhgN4WwtVd8BRzod0TjtzuWjvm+S/BRGPAh3dugFfFgXjDyamn8oZcapq0
	 QujrEcCUvFM3hlZQWNgt8fjBsKYxMi0o2m8iFpX0nUEZAP3HIWrL9Dvft0gDUl2vAuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JCMpY88q;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A66A606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A66A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JCMpY88q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80EE339;
	Tue, 24 Nov 2026 07:38:12 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AEF43F763;
	Tue, 24 Nov 2026 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795534695; bh=Fd8vAvfcXXUJHp0RFzy6EKEGVuJz1PGbur6GX4b46q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCMpY88q8IokCl8JSWWyoOLernXbaTyeGpFLmFA31Mdtr7s6Dsau12yvUwJAU9OrB
	 rnG4eljaVbqEwkgDncXWFMIfOrJO9IugcIiSWmF2P8CVb8HkhtWgnVeyecRb7tTsbM
	 kdA6dCBmCDDrOFg3q3cgBUZ/Tp6jee/Pt/M6gmfs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: Missing barriers in kernel page-table updates
Date: Tue, 24 Nov 2026 15:38:06 +0000
Message-ID: <179553468640.1023027.6271192454790662098.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 12:16:35 +0000, Fuad Tabba wrote:
> Three fixes for kernel mappings that are made valid and then used on
> the same CPU before an ISB, so the access can take a translation fault.
> 
> Tested on QEMU. The runtime changes to the linear map that patch 3
> covers were not exercised, since they require a CPU with BBML3.
> 
> Based on Linux 7.4-rc1 (6628e7d4c6b25).
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: pi: Add an ISB after mapping the FDT in the initial ID map
      https://git.kernel.org/arm64/c/98032adcb615
[2/3] arm64: mm: Add an ISB after remapping the KPTI page-table slot
      https://git.kernel.org/arm64/c/bd63a4741f50
[3/3] arm64: mm: Don't defer the barriers when installing a fixmap entry
      https://git.kernel.org/arm64/c/bb60ce2c3674
