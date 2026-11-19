Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053894;
	b=LxRNjqNmlbyfAsDUHamV+/JIBueuMV53toFRvhvVBd5EW+JFrv//QVJtHFxaVASucCGs
	 JnyzPP0l1AdtFhs+J7SoVrn1LOK1pBUz5yI1NATVbdShONWWVDn5ei/mFdXk3tzsb3ujA
	 p/VALFG08GvE4Ru/1EqNUGok59AaVxwjFDBunUMERq3WVQ6+b1T+vXfHn+W/IXadfI2XR
	 w+sMmFFsNv/D74ZZogq81juxryT0EVAaVOfxML952vgSqkHzTpAAq3E0GQ26BYbyiw1Lk
	 4hAlN0gfAHbYPp3FGGRlI83mmyMU4+mIS18Rrd6bHsUzkbzYL1SibteGTUroz2y+xnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
	b=v9gjczAMUfK0CrCXRyH2fi3n9vuhCZC0lxKKOcO0bAZJTjnpdxVzEGoamJLUJxMEF6o1
	 8pCkjRJApnLlZ+aFYsJiVMnA3AJkw1mLJ1C3iGoRTWNH7h7c1EaG9K6xpPjem3qNtMApF
	 qcjzLAo45QDKAFzWlYT5S0xI/BiDCWMXGo/UuCi6Cra5wTZOOUZtR1stJ2NYvcB5ydSoT
	 i9gczSZqOcvfq9SGIaKn5nbZ47E+DHc11kZI9NLRJwuKhOoM6ifzMaNeo24R2XOJpNCOh
	 QMfw9jcYWX1axFe0siErEEM8CLF/4N9apTQ7pAyk19COyl5kI4C2RiuwYlUe/QtHFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YodJU3G6;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DFA606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03DFA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YodJU3G6
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3f9cbafecso38199a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795053893; x=1795658693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
        b=YodJU3G6HOVaHj6WeDt5Y4UHHP2vfW9vVNUgTmANxu80UmKCDlelZ4zcRR33L8Jm2K
         VswI4nIIqlVSIxBF0tdChGfztska8+jRizlCyMVGMW6uzwjEUVtNom2NNrBrrNNu/FsZ
         yQjf+rFOh5JWBC4KwmazJkkyKrtf0xGwBmIEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053893; x=1795658693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
        b=PJqZAU1weOcvOA/x6ul7wGgvEaH3ghtMTnv0MqznY7t2BNK8E/YwhKzxf4731liXb8
         pDM2bCSvas3AcEM22YbxcszFV4nw3tButPMVEhLBONLjg8qew0OQgl534qMURWfkhFaT
         ybFDg9BtPnpp1duXzFLk5fhi3pzPM9zMe9igHKJtBiSP/XHslx55tUJvMRaYGSLGKTlt
         pRwEKgt82DqhhSrcoozK6Hd3Z2/+3ca4HqfytqCu25YWXqwifNzq0aVENOPdbiFrv15p
         Ktc7094uVjRx1DIykyxDSbbVE1SzieTXYEvrUMG4ZobA0QsbtoAlCEKyJgeiuGODpFTu
         m1HQ==
X-Forwarded-Encrypted: i=1; AL+hErFdhVk9JQSTeEBeKx7AIevUvRper+V1+0cpOkYHBxUNYzAuh3tHLfAmi/y07AqyZi1FfFtU6G00DUyJsY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/blQIVEsq2IaeaClKMtmyRJ1wufkzfX95wIyk1E3T8Qus0szgx
	HM3nMpOP07jT7gMlJIeTk9Ygz66Ho5lYtJ53PlmQv7ZiD26r1PoPWON8XBSfGHUajg==
X-Gm-Gg: AZFdTZc2NjH2BSxhHfiNCdQu1xbISnlDufH7cF4Bb0gZ1P7w1s8XnnuWTi4KmpikKaA
	mjJj7IuMAWnDeF6z9YNKRnYs9OTE5418Vs1o4MUSwJKzkZa5jiOsHd4oZcBViQf7BfWh8JZZ46x
	9Mg48ud5PXxec4nwqqeHjPRVO8sD/YMIPPKsVVsRsrXj8Rb0UZfxN4a4iSyW2Fy5Xt5aVW7t069
	VHYotblteFJNU1S6109w8150JSSfyB/ZM+o4Wv4Y2jS75410/07km5ID2Gu1t1K3hUufcXO7V22
	Eh1ecB49AQ5V/x50im9TBa7U8QQ+4uD661i7fwe0KPXH/vcxAC0gey+KQlG3HX0/1Mhcs0NxVGe
	P9SmaIXm81T3hApY/9dWA1+xzP+mQhgnWS/Fl33KcVAadL0u60L7hIpFnTIYPl5RHc0k8DufD+Z
	OhcfCg89cRvV4xvoKwdRDqC5LwCOhBEGiIZu3zZsIbciwP3rzBRxYw0q9MJtSbO+cWNg5FOm07W
	pEaHfMVZJTSYh/Lljycxo2c7EuexlUHYf48pdSmZyRPI6syJ1Y/1o9+dD8NAB5iRO2V4XCkNBGc
	/25svMeHEEdtpCVmABUpkA8zGngwW2TlL1OTEvGgkRSObRKd9A9p5Fl/qhaf2EtQssI1jw==
X-Received: by 2002:a17:90b:2805:b0:3b3:c92e:f523 with SMTP id 98e67ed59e1d1-3b3d0764320mr7560562a91.3.1795053893354;
        Wed, 18 Nov 2026 18:04:53 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3fe0e5bd4sm772079a91.17.2026.11.18.18.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 18:04:52 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Wed, 18 Nov 2026 18:04:45 -0800
Message-ID: <20261119020445.1096831-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <332f315d-ea27-488a-9a3c-28cdfdcd5f27@kernel.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org> <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com> <20261118012858.289236-1-jeffxu@chromium.org> <332f315d-ea27-488a-9a3c-28cdfdcd5f27@kernel.org>
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

On Wed, Nov 18, 2026 at 10:46 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> > 1) Simply keep those 4 cases under GFP_HIGHUSER (drop patches 1-4 and
> >    7), reducing the series to just the GFP_HIGHUSER change and its KUnit
> >    test.
>
> That's what I would look into first.

Thanks David. I'll wait a few days in case there is more feedback, for
example from the KASAN side, and then send v2 with approach (1).

Jeff
