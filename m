Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464497;
	b=QKnHHsactcWZF28se9TxZPBcxEd2RJpbbku7A0CC0cZ6XBG6AHRHnpfzCy90NzSESB+G
	 Oly2OkhVYbpokVGN4m0TPEPv6aYT2h59fZkjYkwqn6qmDhFrcMMkh25UPlR5wZmSOMDoh
	 hEHFaOORw/Pc88vJapoUxnvbs39IQMXKZbLozL4z80XyKKsCaaPjrpMd8oR+h/ypSAYxV
	 dcM5/q9k3+tWalQlpnKm9mCBd3mHZZ/JY+HFTH5L6NLsoH91dIRDAfgJyuhOFCPATI53s
	 IEXdQ6i4nIbsGQnaPYYd9T014qnXWG/r/kIemsB54xYrAPHVpO75IlxRkAF0PAs+pKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464497;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=OhsoY+g6owXOc1DL4OmeSM9RwI0X3DHSQa1NGA0YGEg=;
	b=kYppRc6Xz0TUWEKJW3LMiiAiyk0InpiOaCz4SWj1SQsYUSKPph50QwoOu+inGVm3o3z9
	 qOPf6Jhr161l8Dmerc4cg+AL5ORd8IWgjUgS7sKW0e98zVJ7aJYH6RWsE79utXnj2Jx++
	 O3oyjEDP3LLMdHJQFIvkgeyHk0IOPlBd4lIFz4SJkFthYWcqQ/6tt62azAjKkHhhntvz8
	 V18JROhcs7q6GQIFImk29l+Dl7M3iFFLXkhtV4nFHRCnZpiP9k7mb8nQSEej5Ad46YGB9
	 ukOX4XOObo4q3Nrs7xvUoWJwcKgCVEjZMJRHKFTGcQGZT9eIrdH1YZzGqluWpqfQBzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=ZkjLv4fz;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB74606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB74606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=ZkjLv4fz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OhsoY+g6owXOc1DL4OmeSM9RwI0X3DHSQa1NGA0YGEg=; t=1795464496; x=1796328496; 
	b=ZkjLv4fzwJy1es3f2u3lUcB5cj1/RTjwB6ayd8L9GeIEqaA/3KM+0MbIaqDltiOfRb+27DjYOHf
	DFKnz1bHpw1FyBGOdAxGZkL3zGHuG72w1V6D/eWjVe92EPwr/b8b4KPu3C4GekzfLWLLrldGXcEkB
	/q1dJmSFSkm05bAbxfksatyPQu6TjV5ICyOcOnAq+ttvaOht6rwgUMFmWXWKvruRUUwmGqjtvXX3i
	DKF9HGrLzFbFTbxIB15/tboMWKQ7RAWUCfaw6Eeo8X3SF9Yj9f5YJ5myHaG8db4C85DUl8NHXXdGi
	cSJRmcGEgacffRd+0j7zORX/j/axCO7De02A==;
Received: from [49.207.211.146] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xVaKc-006jgv-OW;
	Mon, 23 Nov 2026 15:08:06 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Subject: [PATCH 0/2] MAINTAINERS: Add missing files to KEXEC, KHO and KDUMP
 subsystems
Date: Tue, 24 Nov 2026 01:37:52 +0530
Message-Id: <20261124-fix-kexec-kdump-maintainers-v1-0-79c6a6144de4@csail.mit.edu>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABidBGsC/x2M0QpAQBAAf0X7bMvdSfgVedhYbHJ0h67k320e5
 mFqmgciB+EIbfZA4Fui7F7F5BkMC/mZUUZ1sIWtjLElTpJw5cQDruO1HbiR+FPhEHFy5OqGqHK
 2AT0cgTX/713/vh8jKNq+bQAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
X-Mailer: b4 0.13.0

Several files relevant to the KEXEC, KHO and KDUMP subsystems are
currently not listed against them in the MAINTAINERS file, which would
cause scripts/get_maintainers.pl to miss recommending these subsystem
maintainers or mailing lists for changes to those files. This series
addresses those gaps.

These patches apply on on top of Mike Rapoport's series:
"arch, kexec: declare kexec and crash capabilities in Kconfig.kexec"

https://lore.kernel.org/kexec/20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org/

---
Srivatsa S. Bhat (Microsoft) (2):
      MAINTAINERS: Add missing files to KEXEC and KHO subsystems
      MAINTAINERS: Add missing files to KDUMP subsystem

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)
---
base-commit: 3e14cad9ff9ece9c0115ee1d80eef398659db0e9
change-id: 20261124-fix-kexec-kdump-maintainers-f3a389aa6329

Regards,
Srivatsa

