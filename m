Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177982;
	b=JdWclSeLMEeTfa4hajQi7BvrKb4b27b3u5MZE4060U0oF2YO/Egc552UGEgV8NjTa1Bp
	 9yxs0jNFkiVXkY7t7k78IYGASYxcvqIuRD06UJT+pP2FQHnkeTdzzY7LWs3sx9jB+y/Ic
	 +hxvzDhsyZCPr6ORFdWBJSVIFoJuhgT/3EZnTipv+F3wAYxDiIL4o6Iqbz14oKzTmU7kF
	 pHLJkzzhro2gJLXSlgHtwE486oxINStQ1xJKlECJCSFpUOtSWwEzoQ/bf+zDVW/N/8DoG
	 NxFUJMPhWBZZb3vGS8mkL6RkWZb7L4Rv0NQVvd9dr0tDmmtKdr0imbizqSdoO5ORKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=y1Wkg0jR0Nndjb05E7cUt8QKw6kiQJc1XIXRzVqfiAU=;
	b=TimL0YRU1e8uKCnSH6Yq2V/Bq0LzygJOIm/siRLzwyU30dgIZl9bbZcTM0355jD8fyef
	 rfnjlp7FMPRR10URpAiHrUwvZVObI+7tKa93rqJLy5jLnyzq/49YNhKP7w4MMm4fgObW9
	 Tsnl0DJLy8M9YngWTbkSb+HbD7iTaCujpWD2DGvzYfg0vPMxpPh+K4l9R6SC0KFf2Cia3
	 9T/sXC9RFSIkZx2LbnH26M88/bqHzjO5do1HbkXfEW5FY4SL9xGtHXF3IfBxeAVWCBPNx
	 MxKSGxV4YDxwuFdCQ0giBuYKBqvS5USOIv1oLW2Yrl/PpWzindRqIe2b0LBRYMMVxgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qbwklCFC;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333060A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0333060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qbwklCFC
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e30c26a4so419826866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795177980; x=1795782780; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y1Wkg0jR0Nndjb05E7cUt8QKw6kiQJc1XIXRzVqfiAU=;
        b=qbwklCFCQWBYYh7Vdm/EvOhgnw0GN36ZdBdjQhkPfUQrBI5NBk6W9T4MdRJopZQZjo
         P6262a/dhJ7Co2zQpiKrl4G+woYgY042jWu8/3ZHeVK5ALDluxaUnBxbAIoZRRHJPu8I
         giCejoRuk/NeTe6oUF2GyqxtzLSYol6p0d/hxOP1dljaEd3BGsyiSxjP1aQh+9pKGEZ+
         PQ9OGYDSwCcUE41GIQCd148T7eMUZNRhT3F9VOX0RluZQQ6m3tXsa64kVRnLvhW5Q/nX
         YIq71Ek0W8WB4hUCj8xaGcwb6t0xcDq0L45GukMS4+fS+2IyVZRwH7HQwRq498rhEgbO
         D6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177980; x=1795782780;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1Wkg0jR0Nndjb05E7cUt8QKw6kiQJc1XIXRzVqfiAU=;
        b=2m5/V8g2OqZziJv5Berhr+xDGH/IwdRl4lSEeeu6inYUeI1NhfglECVLcJ7TVmMwaz
         qaRr8LpsJeKNqOnHZTv5AH8H6Pq5nWElV+8lPux1WxX/YqOQhLkGEZQfAFsz+tQH6sea
         N63Zj9EA5SSe0Qx7RmYGnQ0Oe5TuNTteo9hyLoxVWFCAjTe9kKZVg2oV/XbJoQdYeMBc
         ClXFBh11gCAp1+qdlnqmYmyk4g+76CXNHKx4aXXvnzUKhDkQmMWeWyLEwNCPCP6s3uM/
         uvu/pOb2UnrqXOm3HrbDMlBivYE3WMhtwgcwMd3nLxXSgAnBdBfRATU0E/njapvkqy77
         2Vmw==
X-Forwarded-Encrypted: i=1; AL+hErHFjs+8ooiNDPoCP3+tRfOWwU3B5a/MmuRJ5pdMnjJQDEp8YGhHZWjkdwop/waCqTILMbdX/rwLLv/wux4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C0C7NeNm/dY6wPhTyWuOU8KwJbN3jfLQDUFrrCgQfCwcq0/f3
	noFkDDotE5iwWN5HetiJ4B/AOoKSstJvh++wbLCUFhzMciJwi4KWqOb5ucVaKEAb9Y63
X-Gm-Gg: AYBFou0E8Izs8Nnb4VKMxZDcplAnWoV1hyEj6K6pJQwWYx7RkWBfG7uUDJujS09y0JW
	okZHDGROAcQa2A6Yx3cbRNhP9AEhkp+E18cubNUMMJVVDb249GaWzumBej83tWLru8FZus7qG+V
	FoO5zy3Ww6WgUecu8jZtdz4mC//TFRsVLoz5bN2SauCAfG6Wf4fGFItqH39CofbJxgc1Hy8//qq
	e4FvQRk1lwX4zV7Tvks9uwMNkqn9mu0kTG7XBf4DIpDA2BvcOk615ZiiQN+g8dsUuVLeAl9otpJ
	IEzrRJOfl/AEfDac73pTDx6Icf26Qcv1R95tvQlEJJ63zXGpqQ0zouCu4vLb7w2vLDyrpaHIMHI
	I1r8Liwap9Be8LVTFMoOFHobv4XUi300jC28zKobX6HjezCfEOlPkyRHxmw9Sxbu/HdcZ6GyNgu
	ppVurm51P03CI1N3dPBGPzzQObddkAMu0r4FkyqFYZqb286wMv9R/ANMobIRDryAoUSqDshoJaJ
	a5l+CnMGEoG30ymFYaDltX3NnB/r0aDDXBszaiNDgkRZdKSGvDvFGpu51MUe37H5uOapuV6Feay
	X2q2WZ59I9SY69xJlv+p3rEFVjRc/aki/e9WffjqpGz48y5BZ4TN/doneCfLAXOUzA==
X-Received: by 2002:a17:907:3e87:b0:c51:24e5:f5d7 with SMTP id a640c23a62f3a-c51313a09eamr445486266b.0.1795177980204;
        Fri, 20 Nov 2026 04:33:00 -0800 (PST)
Received: from [10.0.0.233] (tmo-084-188.customers.d1-online.com. [80.187.84.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm6008114f8f.24.2026.11.20.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:32:59 -0800 (PST)
Message-ID: <c301fff20a4920fcd3baa31dda2e31ad99c93436.camel@amutable.com>
Subject: Re: [RFC PATCH v2 00/13] Namespace for namespace roots
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Andy Lutomirski <luto@amacapital.net>, Josef Bacik <josef@toxicpanda.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner
 <brauner@kernel.org>,  Alexander Viro <viro@zeniv.linux.org.uk>, David
 Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>, Serge Hallyn
 <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, Paul Moore
 <paul@paul-moore.com>, 	linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, 	linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 13:32:57 +0100
In-Reply-To: <CALCETrUbe8rBoxrC+Q66AMsrJ8Fow7xt5KJKRAmobtXBvHWdqg@mail.gmail.com>
References: <20261117231352.3816603-1-jarkko@kernel.org>
	 <CALCETrVUkbpoFjwSAejyA4b_9qEauAP_36i=O8Op1ifp8aUkqA@mail.gmail.com>
	 <av3akYFOYaeQZauZ@kernel.org> <av3bkDnwmjunTleX@kernel.org>
	 <CALCETrXPLeUgxyhjP4XuWS46FKB0TUHF5PcMkdMf+qeEXbyXRA@mail.gmail.com>
	 <9463a969d35a7d5ec5a56aeb67644b94.josef@toxicpanda.com>
	 <CALCETrXt-Do28BHDpbrA98kEy-tQuorxD8c2XsW24Tt8Vspdtg@mail.gmail.com>
	 <CALCETrUbe8rBoxrC+Q66AMsrJ8Fow7xt5KJKRAmobtXBvHWdqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-19 at 15:27 -0800, Andy Lutomirski wrote:
> On Thu, Nov 19, 2026 at 2:50=E2=80=AFPM Andy Lutomirski <luto@amacapital.=
net>
> wrote:
> >=20
> > On Thu, Nov 19, 2026 at 9:30=E2=80=AFAM Josef Bacik <josef@toxicpanda.c=
om>
> > wrote:
> > >=20
> > > On Wed, Nov 18, 2026 at 9:46 AM Andy Lutomirski
> > > <luto@amacapital.net> wrote:
> > > > cells: The dance where I create an anonymous mountns, mount
> > > > stuff into
> > > > it, and then attach it to the cell is cute.=C2=A0 But I think the
> > > > userns
> > > > interaction is wrong: you are making me assemble all the mounts
> > > > in
> > > > *my* userns and then clone the entire tree into a fresh, non-
> > > > anonymous
> > > > mountns bound to the current userns.=C2=A0 And that clone operation
> > > > is not
> > > > free and serves no actual practical purpose.
> > >=20
> > > The copy buys us nothing, agreed.=C2=A0 That's just what the mount AP=
I
> > > gives
> > > me to work with today, it's not something cells wants.=C2=A0 If I
> > > could make
> > > an empty mount namespace and fill it by fd I'd use that, the
> > > "root" slot
> > > takes a mount namespace fd already.=C2=A0 Extending the API for that
> > > makes
> > > sense to me on its own.
> > >=20
> > > The mount namespace staying with the builder's userns is on
> > > purpose
> > > though, that's what keeps the cell from mounting anything no
> > > matter what
> > > capabilities it was given.=C2=A0 The builder sets the tree up and
> > > hands it
> > > over, so the cell only ever has what it was given, and the mount
> > > code
> > > isn't something it can attack from the inside.
> >=20
> > I don't get it.
> >=20
> > Using the builder's user namespace means that the contained
> > processes
> > can't be ns_capable on mntns->userns.=C2=A0 But this solves very few
> > problems unless you also deny the contained processes the ability
> > to
> > unshare userns and make a new mountns, and if you can do that,
> > surely
> > you can also deny the ability to modify the mount namespace.
> >=20
> > As just one example, a mount namespace could have a little flag to
> > say
> > that it's *in* one userns but its owner is a different userns.
> >=20
> > >=20
> > > > cells: I find it *incredibly annoying* that one generally
> > > > cannot put
> > > > new mounts into an existing container using most existing
> > > > container
> > > > managers.=C2=A0 I hit this on a surprisingly regular basis.=C2=A0 Y=
ou
> > > > seem to be
> > > > baking this into the whole cells design.=C2=A0 Why?
> > >=20
> > > By design.=C2=A0 Allowing changes to a running container is what
> > > causes the
> > > problems.=C2=A0 If you need another mount, tear it down and build it
> > > again.
> >=20
> > What problems?

Dear friends,

Dear Andy,

>=20
> I'll add:
>=20
> On a non-container Linux system, you can hot-add a removable drive.
> On a Linux-hosted VM, you can hot-add all kinds of devices, with or
> without the help of the hypervisor.=C2=A0 (The hypervisor can hot-add a
> device, and the guest can mount network devices or newly added USB
> devices on a port that was already assigned, etc.)
>=20
> For some reason, on Docker and its sort-of-clones, approximately the
> best you can do is rbind in a directory and then mount things into
> that directory from outside.=C2=A0 This is sad.

+1

I guess the root reason here is what you've mentioned - for VMs we have
a clear separation of the host-side (hypervisor can hot-plug a device
to be visible on a PCI bus, for example) and some agent on the guest
side can react on this change and do something depending on how VM's
owner has configured it.

For containers, we usually don't have an agent (at least in LXC, OpenVZ
and Docker too). So it is a container manager's work to figure out how
to hotplug a new filesystem for example and where to place the mount.
And this was always a reason for some crazy security issues, when some
privileged process on the host was entering a container's namespaces
(partially) and then suddenly become trace-able or bring some host FDs
(and these FDs could be a way to escape via (struct file*)->f_cred
permission delegation model).

Another reason is that in VM you hotplug a device, while in container
you can only hotplug a mounted filesystem. And for devices we don't
care under which major/minor they land and so on - again, because we
have systemd for example and it can figure this out. For filesystem we
need to know where to place in in a mount namespace tree from the
beginning (we still don't allow mounting a block-device based
filesystems inside user namespaces).

I really like your point and that would be great if we can solve this
somehow in a new design.

Kind regards,
Alex

>=20
> I get that there are plenty of workloads for which this limitation is
> reasonable, and there are more workloads for which this limitation is
> silly and people have learned to live with it because everyone
> imitates Docker and Docker is limited.=C2=A0 But there are also workloads
> that I hit on a surprisingly regular basis for which this limitation
> is genuinely annoying.
>=20
> If you want to write a container manager that shares the same
> limitation, fine.=C2=A0 But please don't make it into the kernel without =
a
> compelling reason.
>=20
> (I personally think that Docker has a *lot* of weird properties that
> make little sense.=C2=A0 This is just one of them.)

