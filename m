Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787334;
	b=lzcC2v5vRtG8lufKet/Cv0qT2WBwvbZTRUbpl4Jl9NiO/Z/Wz2L3MvrIcDa8TIa07+dh
	 vrBL5xgHtqdMB3a/8cWGEl+V1ospCT0Dv9cxyfsG0KU7OVm3llCn4h+ke1Zfp1nurByJf
	 yMHVrmOAXds9ZqZk17iYewhEDe7Baipjv5cVrIzLCTnNkvXEBlAOgqUlgyL5f5TvvDRW3
	 yrWm/ER5yZaU14iT246H81rDkmg5R4SWD2RPf744BkLNb9YOp7tuzkUu19PvlS4x8sPfK
	 mo6jzKarTKd3qvwHv4RuYALJIEfSMHGFFhFCp8fdJOH/fw1SCeXaIvKyJWnynTBiUkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787334;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wt7oLlwiqXLmzKAoSU5vN0ixIevPua7dT/vw9dDykFQ=;
	b=RHDWY/f31AYxQGWBJr+99riHWXdM+onA1xZbCcWQInGcaiABuOG8jmxazBd4DBrornOO
	 K1Rx0jpyurTOJv6ZOt4iGWuQmMlE67hGHSKo7WYWZVAWXXYZT2GwATcAJXglgiryW0UvT
	 UIPBV+25qejHZTb8wBVzua5RBVE099R1JDD4FJmnFhDNRKpEKob6aKbT/CsERW6faLhOV
	 h5NK6fogG1KcAHAxEtodvpurpqxdBHHr7aQm0eNj+4HASWdkYEExbYNFicziMJcvMTsAg
	 4ZB24hiwPxzabXK8tfiKZPv+4lb1deL6KXD72gSBjWE1bfTiOVhKAoqss5BrX7o+tJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=JFpxIH7w;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EB6606A696
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EB6606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=JFpxIH7w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795787327;
	bh=wt7oLlwiqXLmzKAoSU5vN0ixIevPua7dT/vw9dDykFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JFpxIH7wpD5EEez0vbmTZ+7FUsukfes6UMnwsdRw9RQZOtIesl+ZuA+ZpPLBdYnra
	 k1LCkK2JmGJo2hgBTXdtLaW1maVkmh3VwB8W8lZ6jTpYbbcDbc+ujjE3ftXmO8M4N7
	 vamlnyfE05tXi2M2lFJ3kX6R8n904xhwHZdPGQI79vxbUWHwpzbZ1R5CL79HFvDGxJ
	 3YqmPBsO6cOmCoWd4LJx6DNazxqZiGOunwvSWTQXXIhXbBqRquCxGik2iOOhXi5URD
	 bcMhiWNPz6oVeEO1oHRlrTMBf7gfk3BKTyKOJ8wHrkJHQeBu7Z4Tp5qA4BIV8H3/Ol
	 2J2aSbgDvDZgg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbZWg1bZVzXPB;
	Fri, 27 Nov 2026 08:48:47 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 31/43] sched/deadline: Restore the owner's period at a deboost out of the class
Date: Fri, 27 Nov 2026 08:48:37 -0500
Message-ID: <20261127134846.114774-9-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-234588@kernel.org>
References: <c53e032decdc0ae447feecd391faa770e683dd89.1795646914.git.mathieu.desnoyers@efficios.com> <sashiko-outbox-234588@kernel.org>
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

> Should switched_from_dl() also throttle p->dl and arm p->dl.dl_timer when
> held is true and p->dl.runtime <= 0, the way dl_deboost() does?

Yes. In v12, a task enqueued with no runtime left before its deadline
will be throttled at once, until its next period. Patch 39 then also
asks for a boost there.

Thanks,

Mathieu
