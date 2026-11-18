Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020574;
	b=jHwbjFSelXySlupK8aH7lWDESszZG3xrgfGNTHWKztOKtoMqOTqC/9UCSI9U4W6HBdzW
	 oMC9KmQMVf0Xj3sj5diEmxSlIu+4VRVV57XFVqbdsn5aKISF30XAyigjz8NOLY3h+eM71
	 Py921WoSOMTU9r/ibDQUyP+vA2gBaiTUmZ1L0ftPpDXOK9DUPRp3R2vgE/4PPjvezkr6e
	 MZFtu8aLKyZKtAvWlPdkuoN5Em+65ruW1QubUGNbClAxZ4kW9WmUgvX1TbHmNFxSya4Rn
	 GTs0YlavJgsDIHlOrBfYHxjlEetW+iC+zVYvheptPtxl0HR/VpdtFRl0WODTjN5zICg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020574;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=CypiicFre4WBwXpeVK7ccOtlft0aGSxKx03rsPEEj/g=;
	b=I9Bm/9ZMJ+9h38+HD9m9H543Q2nLjQjc4GZhiU21gEIdwicjLfu/2QlsFNhaLeuG0OH5
	 lTeB9sNukahYEpmc9xMG/06d/pXhLT5eFqGxFyq/7ZwPb679VWI2p44EAlBRq+QYia7gu
	 ucw5OFcwAGA3z1b/mCtt31lchRewIGRd0/ICmSUrJ3RS224OwMxROsWdqry0chZgGbVZf
	 yI1ZA6R8YXr+iiVVikdXvBfMGKP1mF/zy2AcI4ii5nMVk9oBgX5WXlWfq/cbhOGXqo+O/
	 pyTve6tEb1z/ABV5gt6rimFquf4HCZfuyxDRvrRa7pnPClxo5mEI7EoVg0rDEelkQPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=korsgaard.com;
	spf=pass smtp.mailfrom=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ity7tghI;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A0606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ity7tghI
DKIM-Signature: a=rsa-sha256; b=ity7tghIOZYfLhjtTnV5SWFkqmvLqm0FUum++BlONR49TMGyIQgT/rTgYsm3cuuFnV920idQQl1LzUy/GTFscKBAp6v1JpPk8aTrETB/HlYJg1gNZTXztNf7AOC3F8U5RD1+f2ItUnprJ0DQlMguQMtvGzpWUElzqa3zpQh0Owj0HF5NHxsv9X1RIgfcAprXbNxwg2gEuLkQHvjRpb+e5EyFANs8DHcleV6AcGJ3As0EW2y+ThBKkyukbkU8HZHkABVEOAAyAkx8CqnnHHCMIEg9GqGab2DiCzZMc8cQ2lwJZt611breWeD8XcK8nFst2nG7zvoF0FvEyUBkg/ZDgA==; s=purelymail1; d=purelymail.com; v=1; bh=PwCwEuAB6fs515WLXtAULsh+c1exq0+R5yemtdnUvHA=; h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 91259422;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 18 Nov 2026 16:49:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1xTiqU-00000000BtX-2E5A;
	Wed, 18 Nov 2026 17:49:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>,  Michal Simek <michal.simek@amd.com>,
  <linux-gpio@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <saikrishna12468@gmail.com>,
  <git@amd.com>
Subject: Re: [PATCH v2] pinctrl: zynqmp: Ensure function names are NUL
 terminated
In-Reply-To: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com> (Sai
	Krishna Potthuri's message of "Wed, 18 Nov 2026 16:48:16 +0530")
References: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com>
Date: Wed, 18 Nov 2026 17:49:18 +0100
Message-ID: <87mrr6ultd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Sai" == Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> writes:

 > PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
 > 16-byte field and does not guarantee NUL termination. A 16-character
 > name fills the entire field.
 > The driver copies this field into a 16-byte buffer and subsequently
 > uses it as a C string. For a non-NUL-terminated name, string operations
 > can read past the end of the buffer into the adjacent groups pointer.

 > Reserve an extra byte for the NUL terminator and explicitly terminate
 > the copied function name.

 > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 > ---
 > changes in v2:
 > - Replace macro/constants with sizeof()(comment from David Laight)

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
