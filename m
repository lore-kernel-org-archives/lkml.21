Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115997;
	b=LuAnTxLH5fOHnTcVfUK16U68aTgse3bYMi8HYb0PNpFl3M+eGm318zzxc0WSUFyMJGdE
	 kYcD6X19w/dDDDxlpNEDm8ONMhclXj+SoK0jIt43aNGwW0ynw5KKGk1OBXkNhbubAzjSs
	 6paTebOK7sYOqRQgm/obX4ywoDzZ7sF6041ntuZvpX0lNkVLbchJiu/5Jw1Wyfoj1K1FX
	 0UNAJlAKBAOdTJOTHESeAbIKrlG4iGxUDweEjH7zmR3LPEgntJLX9fTwE444Ea4fKkHay
	 4EEk7bHApjFT7CPOE/lfxn0HwpT5J7k+cbuTecpmOSXj444kWLMgt+1nVzCWO2g4jpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B3fPYwtnhJtRTzUId1FsxU5BbcK59iDRRgRTHG4g8TM=;
	b=1eiws5iTGKvY3o+XPYq9Nnl/p0L2v5Hly7tPqXaEvzbf/txQSF1HG1W2B7L2v01C2aEh
	 a9W0VNBu+YfRg+55nsXTXNASaMvwXfHi6mE62z1rOBD66oXVgrJ1TYDxtZm8YTbD0tTCp
	 IAbpXJTZTJSBVyV5MLqTejvurdHOVx5DfbtogXQk3/t+nYn7wzbD5pazAaThFcKAKZj5/
	 RK6j+PFzqvnX0jOpr5gH/jG29CMHyBGXD4InUKnUeZeAB4b50FttR5RRY3H9BxaH4llbR
	 IcP04SUtyrIhs7uxXkNYg9rQI75WpoCprX+rvPNK/H3b7HqBo0rTc1Cy9NuefnHPCaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e6cswkqt;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9363B606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9363B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e6cswkqt
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c4d58203e40so9527866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795115995; x=1795720795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3fPYwtnhJtRTzUId1FsxU5BbcK59iDRRgRTHG4g8TM=;
        b=e6cswkqtbr5gIXT7zPqwbxbqDazMSGSQh5brqg3woxMXmbrKcsjWeeblJDpIszQpxv
         TGd/0ALnpNpnRp60nZIXkRb+MGUi4YpzELfsgyKbr4pDwt9UXKuQxAM8wTMa71F87J3J
         YYQ7BIp9fnmNRMjQDqTpqrghxE77fiw7x7nGb+4Wy9iKCcQm8Xc//n2/a/t+2OZIFVuz
         vY5oy9BS16JZ7A7CoPwlDpw7vJHOvZMFy7JAayuM8duhreLgQWZdUtjMkjojacGMmAPo
         XWy8bVfUa3GEHukBLrYA+VA8kAgfdKRZvXiR9bpIv8Lbshi6/T1qWH0+rQhWll7dwZeB
         FMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115995; x=1795720795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3fPYwtnhJtRTzUId1FsxU5BbcK59iDRRgRTHG4g8TM=;
        b=ezIQis1OggB+VdkbPh+blteSiz/Bs3dOGgtkh3/qVT5JMQfJnjCu7MG6kYQ/reUu9k
         i4g6Yk3s14tLGFc3oTkoFOU8kYZ46oOGEGvd/bdRz7HBJn/pvAzEhZq738Aj9MTG/TJS
         QZedkD5coOl2ga5DovGocWEoCbJ6G4dp3RTPIZD5+RMBdMo7x7qx++KP+JS5sSLQ7xEY
         c2yieNND2TXWng5PCIohEc0QV6nBvAE52kG+StJMSkyjIqp8UzLWC7WC9X9iR/EUUn3k
         F9NzyhoPUN9nFD9aaMCyYJ2qHS8pbSTCHtidER4SnQfXpreZVaPyiwA65iekywO78D/w
         4+fA==
X-Forwarded-Encrypted: i=1; AL+hErHHopErEXNSz8KkRHTPNP/pHMUy2Los+rS7kM3lTMBbfo6YIJwhWdfH/RFXiuVJOlxLpdeiYsdWHghbHqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MV57XrhCVr4DMn06PvoBfiJ7qRJZVT4WMQ+0gGA9D5Tzc8Ino
	hONp8LdrHM/Tcu0NJlYmiHjJqHGjzWEueXA1v4/A78+vLJp9tvKvQDHqgxKLTJm2WMpK+Qyf6Q=
	=
X-Received: from ejbgt15.prod.google.com ([2002:a17:906:f20f:b0:c2e:1bc5:6c6c])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:9fd0:b0:c50:a2f1:f200
 with SMTP id a640c23a62f3a-c513a5da8e7mr99034666b.16.1795115994327; Thu, 19
 Nov 2026 11:19:54 -0800 (PST)
Date: Thu, 19 Nov 2026 19:19:53 +0000
In-Reply-To: <av8QNiFcnGWocORy@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119104208.782900-1-halg@google.com> <20261119104208.782900-2-halg@google.com>
 <av8QNiFcnGWocORy@kernel.org>
Message-ID: <av9L2ez51erKkQNo@google.com>
Subject: Re: [PATCH v2 1/4] userns: introduce capability bounding set for user namespaces
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Serge Hallyn <sergeh@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	"=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, keyrings@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 19, 2026 at 05:05:26PM +0200, Jarkko Sakkinen wrote:
> On Thu, Nov 19, 2026 at 10:42:05AM +0000, Hallgrimur H. Gunnarsson wrote:
> >  static void set_cred_user_ns(struct cred *cred, struct user_namespace *user_ns)
> 
> I read the diff through but this led me to dead end. Cannot find this
> function from anywhere. I look the changes again once this is sorted
> out becaus this is interesting.
> 
> I wanted to look at the call site to understand how cap_bset gets set,
> which is not now possible but I do get the gist and agree with it.

Thanks for taking a look. The series is based on v7.4-rc1 and
set_cred_user_ns() lives in kernel/user_namespace.c, where it is called
from create_user_ns() and userns_install(). ns->cap_bset itself is
initialized in create_user_ns() right before calling set_cred_user_ns().

> I'd figure getting this relates to my rootns patches (perhas). One key
> mechanism for me resolving the unprivileged in my use case is
> MOVE_MOUNT_T_MNTNS [1], which is orthogonal but just pointing out
> the problem space.

From a quick look, they appear complementary. Being able to do more
setup operations from the outside generally aligns with bounding
capabilities inside the user namespace.

> I read through https://lwn.net/Articles/978846/ to understand the topic
> overall. Just mentionining as a possible addition to the cover letter
> (not a priority/necessity).

That LWN article is actually linked in the cover letter as [2].

> Hope these help and can be kept in the loop :-)

Will do, I'll keep you CC'd on future revisions.
