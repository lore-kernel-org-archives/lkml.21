Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538185;
	b=xSsaSoFCt12bOuklfGb9Sp+9rZq2mWOar7V2GHGnGCs7Tj1e4Gt5Fr071i8OSlWzcKGA
	 ZYPjtQGBweSVKFztguXLg7hWavkz8Y0BNnVmsFPiTBEDTRFtIPfQcSvEDRIR2a6L11Blv
	 FkPjE7Hg8Wke3aScwd3BzUglh2gK9ysl22Sve4e6+TZm1WrF3Vriln70OnVMp7lTdeftk
	 b7axEged4mwoIj75QjPLMFsLY1kjHBw8BheOzKtdbH+jwECTT7gXHYPTVoAa2kRK3olnZ
	 1oQEqszfluXp83CwHU1PjJ9nT4keRw6KvR7EtHQ/PbU+wiodzPLjiK1/u0mmD2XXa2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=qvYwNBiIdSxY1ryMKCuJ8Xp5CwhF8vXQvRGoOqfiz+Q=;
	b=kGTzy/8BRksW3E79UzDBJjr8PEegVK64C0IMv98Lu5qHPn6VvTfvYMbflaZBVVJicbkm
	 E75IQREEBpTnHlOO6s3M6MvuWEVO5eXM2gkVe0LVibBInp2/cD9BELyK21gT8hmV+c55M
	 j2lr2EIWJE/Fm85XDA29uZZ8zTl/58pOl1jpuDvpLqBiX8KfnYE/Qb0wd5Mse9Zr9XUVg
	 DeTelePI+8Krio/1NU0Y5Ha7Qh9In58f4s7GaiblkZuGhrxK7jVjYMUOskbHZSimtGcfj
	 O+jk7DSQ3Hir78/BtoGMBNobb5b3EV8V0+rHcvrEKUt4Yz9crh0PYzvV3pjOo59v8aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNMG4n6e;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3DF606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3DF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNMG4n6e
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2175326a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538184; x=1796142984; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qvYwNBiIdSxY1ryMKCuJ8Xp5CwhF8vXQvRGoOqfiz+Q=;
        b=KNMG4n6e2D2p0ePKYdVnnqC+xmPY4eU+i6suMxwCdLWC4vK5WeNQNS42eCI767BoZl
         gs3vtmySBpRIiU4uvvZnCODrvNxvZ8epDrUY8w+mNhE18jCz4oBzDKGNx7aZ8DV4zv1S
         /sGYoDAhoFmpF899683cVg+yFsYWeBh8I6M9yXpBE3/6aHGLqSVmPkORCkIc7w+55upY
         qibWPy3pUkD6KR7Ivwig/n55zTj5AUnU2bWbYAil5nb8uBjJ0DSn06HpltLkJJIovU6h
         fOcEwGof59hH7z6cZCRtIT3pdwHg1RgxU6SFzBzRgtoF8L3Q31aRjlM6MSnHXTIFnJHP
         eIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538184; x=1796142984;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvYwNBiIdSxY1ryMKCuJ8Xp5CwhF8vXQvRGoOqfiz+Q=;
        b=aewxUGMv33JlsBBAyNoYpSjEv8dawiyWZPajuV0yVv62zP4rMAua1rUE4J9gZyfb+m
         6Y77szWsed8zkivqzs5SbJUsN/uYLpEM8mUGF5C7tJyZJK9bS258ftegZLESBjqaiRSF
         jI3N4q5UPn1CwDONw5nGCnFa/dYTH7JfUNsnCCKOUs0Ck5q7xnc36c30KCbw4daCZti1
         4Ryjh7if7MPhBzI93BeQ7nXi6IYGFrKBjILrTNzKXJSovOQbKzt+vXKVYC+Y5qK3zV7v
         PxZqQ5yoseZmQb54jhv/m0LrnyG2x7Rj02O6hapHjaSxhJWswR8xMevcGsfATyaE2rs3
         vHqw==
X-Forwarded-Encrypted: i=1; AL+hErFaZrzImHx551nfhHRoIzsCuRtqFDj2MwsLURABR8gVJB/gj9fnfMz2oVaud1N/f94EXlpIWiJ6GOsb84g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6EXQrRcKNr2xS8C1OI06VANU8FmuZGGhqCB1bbDw9ti7rCDT3
	LfdQH64u/xM2W0PyAjat8rmbRHSqAMwwHBOJBDFtBYbvkRVTqskGhzjeQO9QS9CH/79XUcozDM0
	jhWhKbxTT
X-Gm-Gg: AZFdTZcOADfHIFntAQWDyYj+E8tfoo98yu1UesWLKbzIqJha/l6iHI9TnJ3Au8xYBO4
	C3GvrRXFITTqzK810P8DpEIgTPbbFrXykKr+U3uFgE1C4duavoSrp6CN+cwd88bLT6p2bbgsY5u
	z3X4l4cIot7Znqw3D0UZaZrq2l1RwI1YCmd8mSbq2PHgu2Q7LxelUhmzcoQyMMhkS0sLQjxNduX
	cKnuUtrppgccCcCBQJiuckoTyjDkb8IKXDMZWDXEwh7gTO/qyJu0GJPBW0Jnk2ZQZCek8Fe67zx
	y+9duQazemih1tq3ho5CTFK54KdQW8+CSBII+YAFxeQvvHMBGHFfP3IW9KcmgkzhfKlY2I7FjUL
	zi1keYuVFxfCIuMhEyFeZXCKUHR5TlqFRPOXkb+kVZmChefDr+Eg0A3KBofT1mxNuClIZx5gmWU
	9COfyRYQccuqiXlo5NYTKx91gUKe1Bjlsh/ippXUuAb0YMl9qbwRrb2qTtPv0/R3Iague9cHwH7
	YW8Pdv68JkUnEcSCYAhuV6LRCoVNg+6vwV/PTFj9fwF6EMf00u/dJyUdO6EkMltVUUYAFsY9/fj
	U7SGJDzzQLD2Zdxiy0rCtu59zzw2MYn+SO91APpubCE+lbCBPVEgw+uMRTJ/VEmQ
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr149220465ad.19.1795538183777;
        Tue, 24 Nov 2026 08:36:23 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120830sm71740805ad.61.2026.11.24.08.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:36:23 -0800 (PST)
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
Date: Tue, 24 Nov 2026 08:36:22 -0800
Message-Id: <DN3L5XQDSVO9.1NJFYQJTS16ID@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Mike Rapoport" <rppt@kernel.org>, "David Matlack" <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Alex
 Williamson" <alex@shazbot.org>, "Alex Williamson"
 <alex.williamson@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Chris
 Down" <chris@chrisdown.name>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Parav Pandit" <parav@nvidia.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Pranjal Shrivastava" <praan@google.com>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 00/13] PCI: liveupdate: PCI core support for Live
 Update
X-Mailer: aerc 0.21.0
References: <20261118223704.3286085-1-dmatlack@google.com>
 <DN0FL1752MH5.1FSZE620OJBM0@google.com> <awKlfqlQYhphXCvf@kernel.org>
 <DN2TQRX57C04.ZT5UUS6AQ1L6@google.com> <awVjqLFrXY_PCm7X@kernel.org>
In-Reply-To: <awVjqLFrXY_PCm7X@kernel.org>

On Tue Nov 24, 2026 at 2:15 AM PST, Mike Rapoport wrote:
> On Mon, Nov 23, 2026 at 11:07:04AM -0800, David Matlack wrote:
>> On Sun Nov 22, 2026 at 12:19 AM PST, Mike Rapoport wrote:
>>=20
>> Hopefully I did this all correctly... This is my first time sending
>> in-reply-to fixup! patches.
>
> This is my first time merging !fixup patches and it seems b4 managed it
> well :)
>
> Please check I didn't miss anything:
>
> https://git.kernel.org/liveupdate/linux/l/lu-pci-preservation

Thanks Mike!

I checked the updated lu-pci-preservation branch and the code is
identical to the v12 I had prepared locally.

One commit message nit: "Freeze preservation status during shutdown"
ended up with two Link: trailers, the original v11 patch and the amend!
patch:

  Link: https://patch.msgid.link/20261118223704.3286085-12-dmatlack@google.=
com
  Link: https://patch.msgid.link/20261123190045.2166865-4-dmatlack@google.c=
om

whereas "Adopt ACS controls in incoming preserved devices" only has the
original Link: (not the amend! Link).

Not sure which is correct.
