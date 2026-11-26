Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675161;
	b=NiHw6hJcFxpjyRJWNzeqUGPeO+7APY3KOBbB/DHTlBYjiKUw27ZuqIlWbdA4HrY4EIT5
	 4MBy18CWAL+s825uUSk2VdMGIaI+SPTBw1lmSP+ApNVSnzWhR5W5WN4Xyevk7oica5OxD
	 P741IosVKyxnPlnkV7QatjrWEL1Ome98SVWsoQwaUSdo9DU1vPm6IXqRHhHkyBvx2H5FJ
	 +kEiYA4v9GNPp3qxm/zEQ69y7C9rCWTg5LK+sGf4Dgo+bxEo4thEj5je3QBOeUWLLlbU9
	 1tryDJ6Mvk4gPdgRDgQ0sESGTmPL0vNRCIoz9ktzXCyZ25wyE6+r3skQ55NzA+dWaMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675161;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3McccvAI/FLaZGqGJQk/HhOZ4ZrqKkkSLebPcj1nZnc=;
	b=QtYmzj1vLsbGN2bUJn++OWkXgILsCqsgfnexT9MqQKuAhTnX1OPeKNCZa3cFMOmO6iAn
	 27VMvez1c+lQdj95GuoLFMAthh1vvl8SR5UZdrtOEWdM43Cjc0zVBjuvxbiNZ+ykKHrsC
	 U9EdPo4GA8FQNPz9RDKZ15LwjizfHWvD2OZQ4wgKJ7OGEogfLiXgCP4T09f+mhplki5g0
	 7MI3NNipWDVGc7T/QPaEI8IGnYxAg7PKaCZE/TWd1KLh3K3NiM9migK2BErj7qxtBhQBn
	 UDg22NjQyc2PssK9MV1JZ8Ye2RZEcfWvTuV0P6Y73aIwv83pXOIDVGPqqGZuJXacQtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMgrSOKG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF4606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMgrSOKG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A32A1F000C6;
	Thu, 26 Nov 2026 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675161;
	bh=3McccvAI/FLaZGqGJQk/HhOZ4ZrqKkkSLebPcj1nZnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AMgrSOKGVOD1dNuClyYuqAm6kgbeWNJTX9kp7rsd2PvOmScHdG9euwHsAUA5bTS4c
	 SgF8C8JAU2yWxiXrEQ0FtbGgHmrPF0r24koMReV3vKjhRDF1rv/PCZEPWp7U/3a81e
	 DNpvQYfzAZs4uJgsXGTX5QFoj7WnC07HJk23bIQSdO9nxtkyb/2mRoxRyPs5iDrJtd
	 JhFDWcB+Usv1AqX5T/qdHRR/ZOyQg7adMRgG8hyRvL7xCG29Jc3DpK21VGOfsjDFdo
	 TxLy3Dl0HjtsoOuTPhVCzavUaYZ/VTfVkIe0A1rLN8GyGkJZIme94FyqNNZoOIkD+x
	 KK6PYGk679KCA==
Message-ID: <72190fc0-e756-4442-a38c-7b8871e6a971@kernel.org>
Date: Thu, 26 Nov 2026 07:39:16 +0100
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
Subject: Re: mm/hugetlb: a min_size-only hugetlbfs subpool is kfree()d before
 its last pinned page is released, so free_huge_folio() takes a spinlock on
 freed memory (UAF)
To: Ackerley Tng <ackerleytng@google.com>, =?UTF-8?B?5b6Q5pmX57+U?=
 <xuhx@hust.edu.cn>, muchun.song@linux.dev, osalvador@suse.de,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <566ddeb4.2ad04.1a202302fe1.Coremail.xuhx@hust.edu.cn>
 <3b7d2d65-be96-4b63-9de6-7303d2de641b@kernel.org>
 <CAEvNRgFsS3ntQBANqaqdm5XS8c4n6KDh3aODiduf6pCczmBSGg@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAEvNRgFsS3ntQBANqaqdm5XS8c4n6KDh3aODiduf6pCczmBSGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 06:52, Ackerley Tng wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
>> Hi Ackerley,
>>
>> does your series [1] actually fix this? What's the status of that?
>>
>> [1]
>> https://lore.kernel.org/linux-mm/20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com/
>>
> 
> Hi!
> 
> Yes, "mm/hugetlb: Track used_hpages when getting/putting pages from
> subpool" fixes this bug.
> 
> I've been tied up with other work since [1] was posted.
> 
> I have a set of reproducers locally for the various combinations of
> min_size, max_size, and both defined, while taking various paths
> (reservations vs actual allocations).
> 
> The plan was to always track used_hpages, which simplifies the
> accounting and it does fix all the reproducers I have.
> 
> I thought in addition to simplifying and fixing all those paths, it
> would always fix races, but AI showed me a repro with races that broke
> the model.
> 
> Because of the repro, I planned to re-evaluate to see if there's a
> better model/clean fix but haven't got around to that.
> 
> I'll try to get to it in the next few weeks?

Thanks. It's a UAF, so higher priority. But I think admin interaction is
required to trigger the UAF, so lower priority :)

-- 
Cheers,

David
