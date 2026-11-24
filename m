Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545185;
	b=s8XGqf4bm9O4ZErOiGPr9gBk567+KuM/PRzsNFtqqm5jnR6exG2OYECnhFN9I7RELExF
	 Rsxl8iLZ4Hx2mMyHZvuas8aFMt6wr7GFK60ZLurphic3tITHTYO5rlAPMybxx2uKzY27V
	 pSoBS3hRdMm6dauVC0X76nz8gcbXh0Z3t7xjSrP9V/rCqMxIAhcjxQ18eKc31CRMpZaE+
	 g/B286lBvIHqWMDOm0iEHf39ip22QQwyjcQ5NXx+xEuVydhhBxtu54te32bKnH9Lydd3p
	 S3GvFQ84kLF6CG/NwyXMh+ipzHi9yrt1s0CeG4IFKGpPsyo1ks7jA563KiahdsD+JvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545185;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3Orb80IfccFIGutES0nFJ+RUXeXDGece7CvHjmHyCNI=;
	b=DtXo8U+dxNyvTYmQ/yGEQKQtMhuY1idqS3Eb5GZw1IMKZeDAAY6Zii0qF2FiV+ajA4TC
	 YNffbwiBKZFUMrgk/KBOrlvcS2icuKLpqFUAqOWMVPfcJruoTpwN5XDWqWVqM3JjF4IlF
	 cvh9HM48JOYxLAUU6cn1g1EUDIEaTnn7svxEzgNubciIj8UZ5zSrdwOJlYbSMxfhKmfrh
	 NmtG8zW0W9IPizuzcx5ZZFLmMw/x2ILeXd8nlCmkYoe/iaRg3/8cqHFM3678MqRuRFKXU
	 Re9XyNzyc6pw0MxQBi4OnD938gBBEhUn+/rjZ+n3UvYsFWmjtq2AYKau5e6CRyqSS9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r++VktNi;
	arc=none smtp.remote-ip=95.215.58.65
Received: from mta1.migadu.com (out-65.mta1.migadu.com [95.215.58.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3289606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3289606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r++VktNi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NWziLWE+sxpv1w/H1qz5Zsm7vidAAL+sWIAKb6oHxg0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795545182; v=1; x=1796149982;
 b=r++VktNiQzCxlQ9NVvoCqbygOf9txrYWLi12WjjB0ftE+imo/AyPdskVgyaLPfeukt0TfSqe
 BXWJNEhgxBQ1/EQ/Ak/i6RS20djmOabxJq5ESbnGrlHRrXmotuX8d4Th9wwt6Bnol1xGgGDA/pi
 vPFgXPclzCzRa6K3Iepbvj04=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21af0ff3c44373d1;
	Tue, 24 Nov 2026 18:33:02 +0000
X-Mizu-Trace-ID: 21af0ff3c44373d1
X-Migadu-Flow: FLOW_OUT
Message-ID: <2751f03e-e93c-4889-ad41-c2d846212920@linux.dev>
Date: Tue, 24 Nov 2026 19:33:01 +0100
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
Subject: Re: [PATCH v4 1/4] ASoC: SOF: Intel: Add IRQ chip to distribute the
 SoundWire IRQ
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
 <44756a36-bda7-4a3e-b3f3-67c2aa9b8883@linux.dev>
 <awXEJTvuD69pszTw@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <awXEJTvuD69pszTw@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 18:06, Charles Keepax wrote:
> On Tue, Nov 24, 2026 at 05:49:21PM +0100, Pierre-Louis Bossart wrote:
>> On 11/24/26 17:09, Charles Keepax wrote:
>>> Add an IRQ chip into the HDA code that can be used to trigger the
>>> SoundWire IRQ for each link. Currently, only the SoundWire IRQ
>>> is moved over to this IRQ chip, although in time the other IRQ
>>> functions could be too.
>>>
>>> This will allow refactoring such that the individual links each
>>> request and free their IRQs locally, rather than having to rely
>>> on looping over a list of links which is tricky to maintain while
>>> destroying the devices.
>>
>> Well, there's no such thing as a per-link SoundWire IRQ...
>>
>> The hardware is built in such a way that once a global interrupt is
>> received at the HDAudio controller level, the handler has to check if
>> this was an IPC, HDA, SoundWire interrupt - in that order. And in the
>> latter case there's no other way than iterating over each link.
> 
> Yeah, hence why we add the IRQ domain and claim a shared interrupt.
> I will reword a bit for the next spin.
> 
>> Using an abstraction to make each interrupt source 'self-contained'
>> would be fine and probably make the code cleaner, but then why stop at
>> SoundWire? I'd err on the side of 'go big or go home'...
> 
> Yeah this definitely could be expanded to the other handlers, as
> I note in one of the commit messages. But not really sure I want
> to go that far as it no longer relates to the issues I am trying
> to solve.

understand, this would probably need to be handled by Intel folks, since
it'd impact ALL platforms since GeminiLake - 2019.

>> At any rate this would be a significant change on both SOF/HDA and
>> SoundWire sides that should be handled as a well-tested prerequisite to
>> the series to allow for communication with the device during remove - it
>> doesn't seem right as a patch casually added in a v4...
> 
> I can split this patch out to a separate series if you prefer?

I guess it's more the Intel people who'd need to speak up on such an
invasive change. My recommendation would be to pick this patch and make
sure it's well tested with CI and daily tests. Whether it's part of the
same series or not is not really important, it's the test part that matters.

> Apologies, for the changes a few revisions in but I had generally
> imagined doing this would be too much work, hence the more hacky
> approach in the previous versions. But it turned out the rabbit
> hole was much shallower than I thought.
One open that I have is whether the dispatch of the shared interrupt
will deal with the links in the same order as with the explicit loop. If
not, there could be interesting timing issues that show up.

The other remark is that the free_irq() introduced in patch1 in
intel_link_remove() is moved in patch4.
