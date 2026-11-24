Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550239;
	b=P8Qm0zsDUkbumgAHagE5XIg3LnUakp52Pl6b38/MwsaxEMy0qrLsuUaxOzMPSL5QhxqV
	 4ArbAjPDMMx7PdU01n5DWXlKzQ91DIooIJkMrd5PW+Kpm2+iqVm8Ufpme9F5yHLaVIUCY
	 p395nksAdISIxeFE+8J1zkyijULb1UIdIPSRc/cbQtmdc8aGzxqEvRr+MA56C07wzsT/u
	 zkmqziImMszg/0pKDP+E+SrS9JujeoQgRJud0rmMnH5nh4NYhjr6m10yFF9iE0Ymjy28y
	 ZAU7TvjZR8I5RULh2lIislJuxTLiEPymHb9h01YLkjAgkAJJ3oCohp9ObRRVEJDTGiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550239;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GvTBx3SWfsHsXzfmPLEMfq8rSPuRCBnLn2CVl4+lqXI=;
	b=mD7a7TqMDqcOGJbev9na34/itPGA6KHM6cpUckeITenVQOGTJ15y9SBuU6jhYOE0YWCb
	 f4POukMMPrVEuEtwrtxEtx7Sg2JUvUKRA5QUDbEacUCouR8o/RcOTMGS3IrXcdckpKOZ6
	 uCqZb1vWb+Va3bp47I18TsJyk4F9kZdRJhJB6ePZZSOEZdEJDMweLq2iO+KipGSU3JI8t
	 M5EKvSUcBvyEtuJGuPn3jcse0OdlFmDe9CZZfOV//HqighflQ9zf+YBImx7zHsi5Cyayp
	 KFqQgU9HOCly6dziaajK1ANbJavQCxC4jp94G79iKKzk+U9WUgKONCi60XglkqXnpHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAFZPikH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAFZPikH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEAC1F000CA;
	Tue, 24 Nov 2026 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550239;
	bh=GvTBx3SWfsHsXzfmPLEMfq8rSPuRCBnLn2CVl4+lqXI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RAFZPikHQ8uonDh8njmHLYB7oJyb3btujbsNyBkOJqvKTTD4M8RwHCd1srVKzljio
	 AVBtbP3Kli2bVS6E4Z/kf6q0LzsVroBLGDb+cK1MQwGqjY8i8Dd6SEYla4nkK7UFUP
	 PJg6VPD6i6u+aqncd0++a62QnAwlci0j2qxgi0wI7rihhCut7dlbC6cUxj0445G9c6
	 3qICeps5AeQJCw2HZZ5U/49Me8NcujDtll3OY8+Rz/MzTDwT3pv4+o4HQkT+nT2o9D
	 JSnK963XHm7mzmN6gWkoMhWZFmes2hfFJxv6VCT+uWBsHTXzPIcdXKMLvTusEp0dJq
	 Xta3Tsyi/J/NQ==
Date: Tue, 24 Nov 2026 09:57:18 -1000
Message-ID: <d966a0f7346e1bf9061e4cccecd14b6e@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org, ssengar@microsoft.com
Subject: Re: [PATCH] workqueue: Skip redundant unbound updates during CPU bringup
In-Reply-To: <20261124180010.1505819-1-ssengar@linux.microsoft.com>
References: <20261124180010.1505819-1-ssengar@linux.microsoft.com>
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
Content-Transfer-Encoding: 7bit

Applied to wq/for-7.4-fixes with the following tag added:

  Fixes: 84193c07105c ("workqueue: Generalize unbound CPU pods")

Thanks.

--
tejun
