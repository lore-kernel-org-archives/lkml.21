Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768228;
	b=tOWKnLcLarAzs05wpfX+zG64fGMkC5ZXQ4kG/l0P5RQW7NjlTavin3gWQA4gyTrG9C+p
	 4psN7LOxXEuzwMzQFA9BxlEaEX34HPJp0laROpvuL81X6E5an+Pt/aAbkFl8n3D8h1U7q
	 shnm1TkJO/kxKzWSmY7bMgnyo4TBBYSUKH/5CsPFxnc0dUFP/Mb0To50x5VHoGv89vcZ9
	 PIOi+2z7OU0f53N6FlqZSG3dgWun9fQ11dYzIzTLsGkBuwSZvKCxZyVg7yPaPdyighDD2
	 WLWz+ybinieTrXmHcIoN8eIF18Z6tTPCPN2TTORezSFRAKYrLZ5leFnEMAmzCd7ru0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768228;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Subject:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AKThJX91BYarCRMVOvVT6MImXsfdSB+lOy2hqZ28X4M=;
	b=06eO3qzNdw3uE4F9+ak01rAewMSqhoGBlvnCEyu+AUgxJTTAVTKog3Z5/lodWqmj9OQr
	 sBMcgR91mNcTIwBKNFM8Ot+8WQjQHq/7HOETW9olKXeB5yMwDPuzss2hzte8iH2zInFvS
	 WAALb++zagX1FMfDsNxWTWKTIJo+me9Rjt8iRq5EaucxfzaFlO6hsGUhzIRQ8tpz32cBO
	 HIU1Q3bBWlrkgMN2cHgfphAQboQkuTiIFMNHY+++AK0EV5QFb+M/nD8pEqsBWkGIXbyEV
	 eY4Qap8JIEzftFL2N8fb2UY8eksTIQl8+Vg1VFsjbpRBfHQ3H7Ykdl5mqIWPmp9ILIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0gNoceS;
	arc=none smtp.remote-ip=91.218.175.250
Received: from mta0.migadu.com (out-250.mta0.migadu.com [91.218.175.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D77606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0gNoceS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AKThJX91BYarCRMVOvVT6MImXsfdSB+lOy2hqZ28X4M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795768226; v=1; x=1796373026;
 b=a0gNoceSi6h3QKaWXx4dDNIlv7MoH1lXGmHi6z3epHs2z941biGMinknTnjHB/Qb0FRzRiF4
 bLITH6MEYVEQUBvZpJcNFvcOGodIsugEyTFsOvuyCC4yuQ/A8tS9FLjOXF03nLs/l5kv4Y5YPOa
 DX8Bs9AtmPPi0QzI7ThcbgG0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2066f3f9e958e4ee;
	Fri, 27 Nov 2026 08:30:24 +0000
X-Mizu-Trace-ID: 2066f3f9e958e4ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <9f5190b7-d19e-4733-8592-376de788f25e@linux.dev>
Date: Fri, 27 Nov 2026 16:30:19 +0800
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
To: baoli.zhang@linux.intel.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 jamie.iles@oss.qualcomm.com, jv@jvosburgh.net, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com
References: <20261120130814.2131659-1-baoli.zhang@linux.intel.com>
Subject: Re: [PATCH net] bonding: fix use-after-free in slave_kobj_release()
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261120130814.2131659-1-baoli.zhang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
