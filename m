Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077636;
	b=sWkz1GakQKUATspMCJiYPypLy5rms4qG1Qm13KTnjdMrUtI6RUP70sV0j1nk7kPEXyop
	 Cgt/vmR+z9vm/E7yvrkiRhT09TGJaCn96PxZvwyT6cp6gMQvlovJgSIn2/BScOoPagxpC
	 yIp8HKD+5IrP+XTKvjhqV9bd9gnlDUKmMrBAhoohEiD7x6NVF1dM4yoPkDuHEAFQB6HO+
	 tymHIuSnaqbiqN42xXYN9JmND9z7H5TeRZgno2g/rgPVFxTo8rmicDZlifnnsUKTa+xs1
	 /9grC/w9KviowNlx0SSolnGQfN+hRQ0bif21VwwzfSbSZ+kqq26wOq6kgb7SQA0IU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077636;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D16q10jNQz3j41y6OLUFp2rQtz+cs22n6LUDewWC+pU=;
	b=3naTqGOWr7KtMKoBhHfm/PvAK62UU+4hwPBx2Rmo3df5nQiF0yyuSZV0uo7Oa2k86Iec
	 8phmXvPcdaTXcO9I8T6B5y68u9AMakUAc6YHluTYMIhGMFwhmxTTNUz9hzdPCfCDme8kL
	 Tm7V0DMut0NVq65pKXmyEonnfyy109Aayh5vf3lZhNO7F4pxZhK25NaC0x7Yabh1B+Wy1
	 CoUe0jns4wcA5R+GM6buu4yyTwsL4T9mqIKxkrQ4DacVHUF/picPYs95Kx8DiMFRm71Cp
	 eIA1Skm0xwCkLwuT/GSbLr24FOYSKHrcCM4n8ApmxrCDPcJ06DrKiEjFjtccXp4UoRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SckUuL3t;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ADF606AF06
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54ADF606AF06
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=SckUuL3t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=SckUuL3tKGCRPUlDAH3wEBmIfDOUaValrh2REAngflboGe0eUgxrs0llPFZpwaRSSqrsEhphl0jte
	 PlhKh/bL5qIhnkZhz3J9s9bAgkycIVqT0FSDfoI8l95XiRb1BMqgQrMNqCYAI/ACWv8jPVjzeUseFq
	 sNfpl/pVE9UFdRuo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afeb601e52-bc36f;
	Thu, 19 Nov 2026 16:40:34 +0800 (CST)
X-RM-TRANSID:2ee46afeb601e52-bc36f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afeb600b5e-5f3a7;
	Thu, 19 Nov 2026 16:40:34 +0800 (CST)
X-RM-TRANSID:2ee86afeb600b5e-5f3a7
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org,
	Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: Re: [PATCH 1/2] mm/gup: add memfd_pin_folios_supported() helper
Date: Thu, 19 Nov 2026 16:35:33 +0800
Message-ID: <20261119163533.523210-1-xujiahao@cmss.chinamobile.com>
In-Reply-To: <8f2a0f78-6f76-4a5e-a6c9-b36638addc78@kernel.org>
References: <20261119104417.312237-1-xujiahao@cmss.chinamobile.com> <8f2a0f78-6f76-4a5e-a6c9-b36638addc78@kernel.org> <8f2a0f78-6f76-4a5e-a6c9-b36638addc78@kernel.org>
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

On 11/19/26 08:48, David Hildenbrand (Arm) wrote:
> It's odd that you would be asking an interface specific for "memfd" whether some
> random file would be supported. It's in the name: memfd.
[...]
> file_is_memfd_compatible ?
>
> Maybe there are better suggestions.

Adopted as file_is_memfd_compatible(), and I have no better suggestion:
the helper is handed a struct file, so the file should be the subject of
the question.

You are also right that "compatible" is the accurate word rather than
"is_memfd": shmem_file() matches every shmem file, not only the unlinked
ones memfd_create() produces, and file-hugetlb files are not memfds at
all.  I wrote that distinction into the kdoc so the next reader does not
have to rediscover it.

Both patches were resent as v2 with that name:

  <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>  [PATCH v2 1/2] mm/gup: add file_is_memfd_compatible() helper
  <20261119163531.315791-1-xujiahao@cmss.chinamobile.com>  [PATCH v2 2/2] iommufd: only hold references to files memfd_pin_folios() can pin

Thanks,
Jiahao


