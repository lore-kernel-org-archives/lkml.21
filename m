Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795346125;
	b=H2hBFvNFsr5TU1Pald8IH6UeuzSXOkPGtL+5zOJmSISYm8tOTlBHgmvakncQJM87Bvse
	 ma/lRqcDmfggi7w0OSfIVzQ12vRY9p6qsLdt6+FaPR79DIa9yMr+Jja7Kbg2NBsYoVzC3
	 AQGfqM/p6VR29hNu2bHjvSw5Adkjyo6veYVCfQkPqGLX42sbt6S8vymAtolbp5Q4p4843
	 LMDq1CqplLYX1NjHrQMgdHawxASZm92ILP5bRKGlyX5u7k0yZhTuJEMTIX4FUE7BmvGiA
	 reUZqcDXL1kiuvmb+TZMEKMAztno/9FNfhbLBydOZF1ZpHc1FQwk8eTRLaCDDEUJUHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346125;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L9lFeo+4KqtRvkcLqx56rHhZdRkgS+HKMfKcTP1+GOQ=;
	b=ivf5IcMwb8TSSMjG6sX4Q13b3YYO9Zb0uozVs8jVCFBxSly/CKH7URc9Qo0O2ZrTa3Nz
	 btqEu2AXRfErQbYS/+w7uYH7MPvlAGRRzVaNepRCjzcbZVOeJtiqYoXA62jjiMgsoNyt8
	 CCshxXd2fbdxLAJ+huHTmuB7tqfxGx7yMBv6SdFdPOnNJyYF+XngC8kfQjzedk2JBu/Ts
	 AcLXGR8okCuaasB1ADHv7OZCUOp6e2dmjf6e2RRyofZ/pv97EFuMNwx9PGx4vAKUToICO
	 fhZ9eRtfJ4Hylo//t238PCfMxcQs3ZUY+pPkVtU0J8vd2BQHgxCMWcGA5Ms5WaKj4DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MKe/qF6V";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B38606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKe/qF6V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D60B1F000C0;
	Sun, 22 Nov 2026 11:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795346124;
	bh=L9lFeo+4KqtRvkcLqx56rHhZdRkgS+HKMfKcTP1+GOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKe/qF6VXp+rIzw15AyXHotbzqaQrc5mRu9ZbxgM3KRE7qxc1g1nPqOrwW8BmOFdL
	 quCsiSnCX9S9/ihsiZnUOxdUFGH3LUeAhYdnEK8B5ofwTJgwQI5OCMUNgs7BNKxGAu
	 Q639My7hU0tXjpNaVteVweemt6pxeagI7zSyZNfC0hBjj4WeONJ9vepHKPcFj5qylW
	 6RiJ+D9QXGG7BRI2KOaMrwbNy9NpapXU2D920ZUIYPMPNJhYmQV3yJWTqQi1nZsMyH
	 Ag+kql9PuRY/Y8KywZAzzeVk7lnOl9PyZd9qGVaIX2MwWPbvwNGDsR12lultkaMiX5
	 qit9B2h4BC4Dw==
Date: Sun, 22 Nov 2026 12:15:19 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ben Horgan <ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v4 0/5] x86/msr: Drop 32-bit interfaces of native MSR
 functions
Message-ID: <awLOxw4B1fgdwsTN@gmail.com>
References: <20261116160259.1579333-1-jgross@suse.com>
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
In-Reply-To: <20261116160259.1579333-1-jgross@suse.com>


* Juergen Gross <jgross@suse.com> wrote:

> Switch all users of the 32-bit native_*() MSR access functions to the
> 64-bit ones and drop the 32-bit interfaces.

>  7 files changed, 15 insertions(+), 32 deletions(-)

Applied to tip:x86/msr, thank you Juergen!

	Ingo
