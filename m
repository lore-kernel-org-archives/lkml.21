Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455141;
	b=KHlgE9x/hA4S0/QNF8zckLPz0iLkyEq1nFb3yi+u+c9yf3lXa4m7vA3PUcmvn2JA+qQh
	 auuqLj3a9ymW816RkeOfkVv+AatGHRIybGJX0LCL1D+Oj3aaBo0S06CUn7sDFoRE7ELud
	 izNgTzdRrl+ayWZFFfQysX45ZfpLJzX1LVX4vjqKke2Eis8KjCjyN4Z0VIGan3Qt652eJ
	 6eZiX0uqD0vAal1Ivdrs2yIErFLD0wmyjzAYjw6gTM3aUVMy2dX0jmQd0i+aa2KkR7icL
	 Po0bj8ppoPalm8aAYsE2W7fGIv0jJBra3hGbOvjkNF0wU48vGxn1E8YCNlxxTa/q0tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=P+l/VRR07HqPbgm9tEPK7SVr6Tlf5vY5XKwCiYVXpnE=;
	b=XG7TGefSkDcNOhh62Q+pZdPCFTYx5jcIiJMBK4zgI36vVlP79XLVTkImHcQYND5DmcjH
	 z5kvDHdGoQDLW2gb/w5/haJgjUBtlc+HDx33olY2EYVpbigu65PzuWPZUv6cBoFhN6nlf
	 keIAW2f+uJByDG1VdvqFZftd6qDTpfgg7y0cjyesmT5bd+gvQ41DfpnkruoymHZm7rzW2
	 ACRywX+aE9TYZ309NxHy57QZtZeUH7r57xKjCy7y4qPX0GUMOeM/OlAfHaVLqiGUbSqBn
	 U+3gqOq8ydrBLRE/eknQbV6dJSYwqszE7kj6DmazHQoAPCy3PYYlIkSLEmgyUe6J9/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GUqMwfdW;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47471606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47471606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GUqMwfdW
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so16497125ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795455140; x=1796059940; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P+l/VRR07HqPbgm9tEPK7SVr6Tlf5vY5XKwCiYVXpnE=;
        b=GUqMwfdWySOE88STspofkPaLQaaZjEwFfhZBDcvXCKXUdwt0IqoJuHyz6c4xJs/dnO
         RLel3qR6lTtHRWvCqUUH6V5nO10hZZlnSxyrXXoEH6W8FwXVOVGLxiAv30EQ6HvrMt1x
         4gFCm0+JmjZI5aW6RAsyZvO6EbM46xOijpgUC6/Gi8xQTSRJxGbSJwxabd7/tnVmiQXO
         v4nAVDKIubL2xTU2aRRz7NEg9/ux/TdNw2zEhqyeTsdVJAu9Sgw1uALVn6Q6ZcCySPur
         zNiBzRfxUKrP/aEvbxj+n/QxJwBzo3JvMo7sIRnvm9/J8aQiFzLnERdkb664faMxpA5G
         xcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455140; x=1796059940;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+l/VRR07HqPbgm9tEPK7SVr6Tlf5vY5XKwCiYVXpnE=;
        b=ru0kgb+SqcpbHgZ3JotG9bRBbunVMtJDCUI8SBTdOr2GmoTP23md+W2cxgOoYxKDmU
         J7WD9n+7KnxLAI39BjE2+m+tlVgdX3oVnkmZHcda8qWdQ6QUdV7AmVYogRqrkbOE5gta
         6KlMGHX8m+EyfcX5mU28O7I98ZLxl54KGfLpndWXucSaCSQhcE181yEqiAEOsr2K347X
         irGYRWbzoYOYxT3lbs4xG2BBtGuB9SOvcO9bPzh+bfeChDDjJXfbdsVzdK8YbDz+2Zju
         OPNwsBcNfcsdHX3bPTHRbTVU77uZfFDIry9I1sDF77yBHyclATIoVWqngh8K9YClcRUf
         r3pw==
X-Forwarded-Encrypted: i=1; AL+hErEVJ85IMD7n3qud3VoebGpN0n5CG9V25u8aDf1gcR3ui+sitkGzeF6eMAu9jUp1GecKCs5ZixF62/gBOCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wIztAe6ArTLmNjywULkcqFuY0QAYUTpfg1wYNV1DaA6ozw/Pe
	Q1rja3p3Cbu2Vyl8P6tiDRYMuaY9Doxa/AbX7OU2ncFbJQomNkHawfvYdF6gfCOaPw==
X-Gm-Gg: AZFdTZdlly8uDC4tXk/BFS1TWZxTz7YpeaZfcp8s0BFVG/Zh0w7kExI9f0WpiM2MlMt
	aq9j+99jr5pvbQRdDk5sTeFZ8DT6+/HqthYAUgcbbdeDEL6HWzxHY97r5menVpxTnTUDuhn5NXG
	i+PNvZ9svECg56Ie5vCrNcttZ0SBPitDeZ+WEXFxZEtknyaagV8JdHd3UOSlOIdXU3GwbElRB9s
	oVvwm49dHdTVTLXi9KMKi3pstnaKIfbZErMterfm+Du6yyUqTdlqZEn1iogONrTRVRYBwfPhkzG
	Y5qr4pPbAMFK/fzVcx9Kgc0Z3BveGIT10h8LofWOq6AmGPQvGht+2n+65T2RF8ZkTtD2oCrDQ9+
	0H92BuiTHvA84sfipROoiQTMul9MVUVSk3F3sltSheFRsj/L1TXc+W/8kglLl2BQsxazf/rX7Me
	dO9Q261HO1Nn1fpRRw8+H87ytr4nBmwxiRHSjCzp8k5hGM4sMKbpya56pKRmvi2bWIa/5SLw1lo
	1ft+Im5BYFoALdyMjHLxxeEqfh75NSk42Gw+5Phz7KyyGTx9EmmbxMM+E8m5Vc/WxUeDnXzJi7W
	BYmexEVbJvAuOduJThy0OyxN6p6d6pKXgd/h9nqKZndss10LVRA/bN0VyzlVBDZ7
X-Received: by 2002:a17:902:e807:b0:2ee:1fab:158f with SMTP id d9443c01a7336-2f03f167d4emr115089865ad.43.1795455139780;
        Mon, 23 Nov 2026 09:32:19 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f051a566f7sm45650825ad.41.2026.11.23.09.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:32:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:32:17 -0800
Message-Id: <DN2RQ7LGX224.3W3PSQ2PBHTJZ@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Tarun Sahu"
 <tarunsahu@google.com>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, <robin.murphy@arm.com>, <maz@kernel.org>,
 <will@kernel.org>, "David Matlack" <dmatlack@google.com>, "Alexander Graf"
 <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
 <loganodell@google.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <oupton@kernel.org>, <alex@shazbot.org>, <gle.com@google.com>,
 <pbonzini@redhat.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <kevin.tian@intel.com>, <joro@8bytes.org>, <kvmarm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <kexec@lists.infradead.org>,
 <kvm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <skhawaja@google.com>,
 <sagis@google.com>, <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI
 compatibility
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-6-tarunsahu@google.com>
 <2vxzse0rzjdn.fsf@kernel.org>
In-Reply-To: <2vxzse0rzjdn.fsf@kernel.org>

On Mon Nov 23, 2026 at 6:56 AM PST, Pratyush Yadav wrote:
[...]

> When we have all this available, I don't see the point in
> differentiating between optional and required features at the ABI level.
> At the ABI level, all that matters is what the incoming kernel
> understands. If the incoming kernel does not understand a specific
> field, the outgoing kernel should just not use it. There's no point.
> Best case, it gets ignored.

I pretty strongly disagree.

An optional feature is one that the next kernel does not need to
understand to correctly restore the object. A required feature is one
that the next kernel must understand to correctly restore the object.
Optional features can be enabled without any compatibility concerns.
Required features must be enabled carefully (IMO via uAPI) to avoid
breaking Live Update.

I agree it's a good idea for the outgoing kernel to check that the next
kernel supports all of the required features it is using, so the Live
Update can be stopped before the kexec. But that doesn't remove the
need for the distinction. The next kernel still has to decide what to
do when it sees a feature bit it doesn't understand, e.g. because no
spec was provided, the spec was wrong, or we kexec'd into a different
kernel than planned. Without the distinction it can only:

 A. Treat all features as optional, which risks misinterpreting state
    and corrupting memory if the previous kernel did not properly
    validate the next kernel's capabilities.

 B. Treat all features as required, which means no new feature can be
    enabled until every kernel it might Live Update to (including
    rollback targets) understands it, even when those kernels could
    safely ignore it.

Neither of those is a good outcome.

> The semantics of required or optional then become "can I describe this
> object with the capabilities I can use?". If the answer is yes,
> serialization succeeds, if the answer is no, serialization fails. So
> with this, KHO_MAP_F_MULTI_INDEX or KHO_MAP_F_DYN_DEPTH are indeed
> optional. All memfds can be described without these, they just will be
> less efficient.

I think this is a different meaning of "optional". Whether the outgoing
kernel can choose not to use a feature is a decision for the serializer.
Whether the next kernel can safely ignore a feature's data is a property
of the ABI. KHO_MAP_F_MULTI_INDEX is optional in the first sense, but
required in the second: a kernel that doesn't understand it will
misinterpret the map. The header needs to convey the second.

So I see the spec and required bits as complementary: the spec lets the
outgoing kernel avoid features the next kernel doesn't support and fail
before kexec, and required bits let the next kernel fail safely if that
check was skipped or wrong.
