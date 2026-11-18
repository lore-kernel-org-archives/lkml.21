Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017702;
	b=VgUip/u2ifK5rtlr+npRQNJwd11gwf+6OtS9233ogC0ju0EpDIHN4Dyhhgy1MOWqPGCS
	 HaWthpe07pUV0ocAvGk4qtTsotGyAvScMuy7IKiaRrxMmsCL8eMa65jbY+r/W6C8h+L3d
	 7cCpdjHsRHeZBWhxcWHQOt3WnNSVsvP8Rhn+EwoBECrpXuQvPCoKcpEFV+ejk/100VR65
	 uRpOuYGGfddRLoIHCTj7FHbYTtyNRrf2LjD+LX/tcfFjYnBBGaXLSlQjg0NiwZqhlRM3S
	 N8onXosVkpy/gV0XTHiqaWow+1DlvL8kN5nJ0TSDfhz3oV9ofNbxGz7Tka5kkCQmyag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017702;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LY5KnYEg62Pp1LvL2umBEQ+TtbgoJI72sal+2fBuBKo=;
	b=WiYIpHkiB81S5N7xOmRrUbiK7p00ktJD4czZ6A0K4rBSzbJhQ2MfMO9JzTLlxoi1PYCp
	 vGITP7VttS6OTEPLBDjybqPio9CPL/SM1DlWgSgEFGjg5hEmyIm7osp5XJ/BmuPpi1vJM
	 4wM314Yr4ejAG7nNdztyuKci2vAKP3PUXe8iuQ+lwfUSNO1ET2Y/KACQYT++lUUiy633i
	 0cv8/v9mb1AMvV8ahO5jHsblkxIuTiFkpRbfJnvsiWs0ciGqLaKP5Bop+JJ5McYnFVmSD
	 FEDWp6PLQKxMftZX2XNuQqf6RGYgASgJ5AONI1YVUdbzD354CA4TK45h5AVOf8RUMRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OzEu8UrK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965B1606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OzEu8UrK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C135339;
	Wed, 18 Nov 2026 08:01:38 -0800 (PST)
Received: from [10.163.128.4] (unknown [10.163.128.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214843F632;
	Wed, 18 Nov 2026 08:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795017701; bh=hkXZYgY3e5AOogVCwFiSPcIssJ7tU5GIgVmY2/vcSPw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OzEu8UrKkTwbKYrQaFm5nAwdhmP5LhADhtVLtftu+FWwlL+6u/SoOj/j2smR5D+qY
	 Hm6S3yq97wLpReP+9UdpiZXJtzV/jJrmpfIL7OgwVDEA7it3Ox58btH8isXP0rCtIR
	 ptUOeqN8o0c9d5YHL/MQuUOz20H8BVhdms3QcOuQ=
Message-ID: <8cc96362-462e-4033-8e37-f9fc9128f6b0@arm.com>
Date: Wed, 18 Nov 2026 21:31:32 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/page_ext: remove unused page_ext_iter_get()
To: Shivank Garg <shivankg@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Luiz Capitulino <luizcap@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261117-unused-sym-page-ext-v2-1-900f4c3c6856@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/11/26 9:56 pm, Shivank Garg wrote:
> It was added in commit 9039b9096ea2 ("mm: page_ext: add an iteration API
> for page extensions") but has never had a caller.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
> I found this with the kunused scripts [1], which I wrote with LLM's
> help. The v1 cover letter [2] has more details on the scripts and
> how LLM was used.
> 
> Changes in v2:
> - Split out of v1 [1], as David suggested, and based on
>   page_alloc/for-next. No changes to the patch itself.
> 
> [1] https://github.com/AMDESE/linux-mm/tree/shivank/kunused
> [2] https://lore.kernel.org/r/20261026-unused-sym-v1-0-82ca2dceabe1@amd.com
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>



>  include/linux/page_ext.h | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index 79c53ec45dfa..52a8b70c525a 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -167,17 +167,6 @@ static inline struct page_ext *page_ext_iter_next(struct page_ext_iter *iter,
>  	return iter->page_ext;
>  }
>  
> -/**
> - * page_ext_iter_get() - Get current page extension
> - * @iter: page extension iterator.
> - *
> - * Return: NULL if no page_ext exists for this iterator.
> - */
> -static inline struct page_ext *page_ext_iter_get(const struct page_ext_iter *iter)
> -{
> -	return iter->page_ext;
> -}
> -
>  /**
>   * for_each_page_ext(): iterate through page_ext objects.
>   * @__page: the page we're interested in
> 
> ---
> base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
> change-id: 20261109-unused-sym-page-ext-3fb8316ac777
> 
> Best regards,

