Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693514;
	b=cMQOPaHwzr/3pygLiSS/6aiuNRMlYRvMUg3551mmzsroaWCVms29uiXLpw7L94qXJFPG
	 qDiIB6Dh7a8q1HM8F6tpTe7XxXv8Wf3R9MSUwrxTU5iUdZQDIw5HsSTloxp262/2yPzJx
	 N4nz216yy4B5MbWXeeAGhMOGCWbixifmv905ZN+KEeWcD2S3oJeUhfWyL6vnabetZQEZI
	 lsmDIp7JBunKflk1O2ssoaRt8XFJjE4xi2iBQRssy3O1ZKUEKn43z6zL4MUq59soyVWv0
	 vCiF6+VdDhAOuZxLB3Tnw9MKvINZP0Ra6O0AUCvwGNC0t/rXp5s9cN59QPbNrWPBrhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693514;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hZduP2sQE9gkeUneqSWpAXjGsaRT+wkgF+eZBdvryg4=;
	b=gwb2s14Nk2gCf/ISXVb0IIRILJwe9ztD5MLEz1nnfToE3t6NH3jssJ0SyKQOdnv4GdoQ
	 PH3y0bHs/997ThFOhHt9VTtkQSeW/pPW4qFWBBD1DMs5Jt+/lne+G5ugyJDcMgyIJ7HLd
	 M+zNNhNxuuQ0teyfmDsBZrVzT/6vwuQELbR9hd+/oPWl6J1fEj2fhDBB2gFz76h3C0s6h
	 puixF8xLgVCirTICT6JWVJWPH68KZtQcjyxBPSPllKXUvUDNUwd30/cuROsXwxYo7h+Rm
	 yn2qa9cXk/bk6QyQiKtZFqoJ5Xwk2N6nW8DOIopgqePJ99w4Hzx73dlWniIPDHwdr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGPLwRl5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB4606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGPLwRl5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408FF1F00AD3;
	Thu, 26 Nov 2026 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693513;
	bh=hZduP2sQE9gkeUneqSWpAXjGsaRT+wkgF+eZBdvryg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LGPLwRl5itV+aeR1X/ZTZEjZE9n7QTLS5WeN9wxiW5eJ+G3sNzUwTPUhdM6f95cI3
	 aEYQD/hdunuQJwqmxqetz9p3RsnaENUjUysATniX8cgDzy6/Apr/7YiWo4XXltcpFY
	 texh2cyxoIfGpf/OSY8vfmoW5wBEwBkctQeKz8cubK2CTWZ7kXJGQp5heASixPFUN5
	 P5jO2b6AAEhzGMVLOPSi1bcr8jZgsPz8XSIZy14ZvCw0ANQuUD9R0ZJysBe43/BKOH
	 pbVGrivRY2h/2vaKGSZoHxfAHfYq+R3LlaLNYMqvmXoYp/E+39CgDHSYmNdvHy4lMV
	 tQQCFWro6PQvQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	"Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MAINTAINERS: Add missing files to KEXEC, KHO and KDUMP subsystems
Date: Thu, 26 Nov 2026 13:44:54 +0200
Message-ID: <179569348035.4110350.13594456540362973475.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
References: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
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

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Tue, 24 Nov 2026 01:37:52 +0530, Srivatsa S. Bhat (Microsoft) wrote:
> Several files relevant to the KEXEC, KHO and KDUMP subsystems are
> currently not listed against them in the MAINTAINERS file, which would
> cause scripts/get_maintainers.pl to miss recommending these subsystem
> maintainers or mailing lists for changes to those files. This series
> addresses those gaps.
> 
> These patches apply on on top of Mike Rapoport's series:
> "arch, kexec: declare kexec and crash capabilities in Kconfig.kexec"
> 
> [...]

Applied to kexec-7.5 branch of liveupdate/linux.git tree, thanks!

[1/2] MAINTAINERS: Add missing files to KEXEC and KHO subsystems
      commit: 77059f4e9b56d78e22b8fa55f294bb2b9ecef85b
[2/2] MAINTAINERS: Add missing files to KDUMP subsystem
      commit: fedac4c07bef7d3ad84110f51a8051e3655818f8

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: kexec-7.5

--
Sincerely yours,
Mike.

