Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555066;
	b=0mNmkXYU/59nH9Y4vUPJput5U6D5dI/74quig+Uy7h2O5BeDlSPl5M8M5KMEqKcrwpg8
	 djFH9MDzfnIYwzFIAGI9BhbYMkA9hm/6r1XMHtQpyg7gO98PqO2pqPygtAy7Wbmu+oAiq
	 87xX7U+6LCKjz6a3pmkLbWNf743575rcGy7oVeSU4MLyWE/LNslndBTB3JY2y2L+7HgDX
	 Z57Tya22lfO+FNLk5KpcGFTS74zXx+pYaY5YP/zEDFBPv4EydTBBrCdKl32yI/wfERKPn
	 pznGwzOPtHRCCLoNfumwQw17J3wp6od7y81zIk6TVgkGBI9gjmiAPzCpjPRZWkE2A6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555066;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=SH+q5ofGi14phG0ByiuTpmcThzlxhhirJElSMDQRI4o=;
	b=Z+JTOtTl2FZhZfvMoXDLXyLCuXDoJYGUFBK0412SUBkiFam1rUppZGaSbUAz5Pn4u9Cx
	 wvaG1Ev/a0VrYT5J0I3hPAnjvAmUE+bMTKm36NzLsfrJdGVIgo6vY3KE62SNv3vaJvp0j
	 k9ndn9gwGtfqzCiN01U5UmkheH4zIST4JBiOdRs/ijWBlRjBGGVMujvIYrNJ0cIrCr0zU
	 PXkTHblZA+Y9FJEGukqyjSR3hwrXD2ci5AXhnblQPkc6eZJclKiZGnzHL9uY5I2sol5dv
	 tU3vLo69Tvv6eOqgzY3O/s1Qg+sB4zqRZuJNODRF8LWK+/5luijj5I6NToL20Kzu16A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9d30qo7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB25606A69E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R9d30qo7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4931F000D0;
	Tue, 24 Nov 2026 21:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795555066;
	bh=SH+q5ofGi14phG0ByiuTpmcThzlxhhirJElSMDQRI4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R9d30qo7EuzvXdpfDW28UosrRQgauasUi2GPu8AdCY64Eh71JsjXvDjKdRkK9nMgc
	 9q2jCNcpl4hV+15vtbZDaHRKkthqjfEOo/l0KGVWdwIAU6YoBtSXZVGXbpEEhQFDj2
	 tMUl9yksYx5R8TdehqY9KaaS1J2ci6BT7Em0YuBcVPBywI8Sv4iCQ933N5EOK/07Yb
	 54wvZLRay+WROO76TkhFL69G1uI3+5LPAdHvI6fe+gX/0V8xG5Rj+xiCKvkfhXMttS
	 +vJxwD0CkuVWUTstAy44En8tqJhcp9yptIkJsl/7Q3A9dkWqmMSSWrm5l+WqjsbCPK
	 B8CwIAOyun+5A==
From: Srinivas Kandagatla <srini@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20261118162251.233513-1-afd@ti.com>
References: <20261118162251.233513-1-afd@ti.com>
Subject: Re: [PATCH] nvmem: m24lr: Remove use of i2c_match_id()
Message-Id: <179555506537.418986.17143689178541306609.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 21:17:45 +0000
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
X-Mailer: b4 0.14.3


On Wed, 18 Nov 2026 10:22:51 -0600, Andrew Davis wrote:
> The function i2c_match_id() is used to fetch the matching ID from
> the i2c_device_id table. This is often used to then retrieve the
> matching driver_data. This can be done in one step with the helper
> i2c_get_match_data().
> 
> It also checks for device match data, which allows for OF and
> ACPI based probing. That means we do not have to manually check
> those first and can remove those checks.
> 
> [...]

Applied, thanks!

[1/1] nvmem: m24lr: Remove use of i2c_match_id()
      commit: f630f2a0930162cddcc6b7a88a9f7e2bfd89ae63

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

