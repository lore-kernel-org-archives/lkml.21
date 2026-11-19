Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108894;
	b=iH5msxHfuOZZkt2O1wYZOjLJzl+W2OgZLhVgxI1XtOmR0T4Ya3mH7LngONjF4s5mp0to
	 LPF9t3/tngK+XHwoNFR4sUjbGL5U1znKXfIuI8iKjFnql/sUFXE5RrsIgMKj9wg8NaU3s
	 K94i+SQ9kVfqzD+XfiJ/SiOr0OFiI9+LQszL9sY5KAEFYV2yhDnao4c7fYszYE1HdtY3E
	 jGUXVGIWUEAtcjKzpbANyw0lSq0UArg8XMX22b2XVgcQ+km2UwHZwol5HMuCWZiy2idsF
	 ipFZi7skLHyETtospp4V+pdSvp8lkYqz4Q8+jLijBeEo/jY8rU7vrnxbv6p62aGU/sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F65s4j3jEb+VZggG89B22KNP6t43t+7WO0QQgAmmc58=;
	b=rZo7jvxLIBW1S90LRsyYCIYHj1xuK13Zt7CbrR8xnoVsgtw/pDfu6vn4cjMTm+BatEnz
	 QxYrKg3DJvW85IvQWD6owcR5JMbcfKH2BEGGkvWtU9xGY1+jqBlFdzQEbGM59/gOLAJyd
	 AEhbVt2tiGOia7f44DpVI0uQa71fI9xwsK8q/U4fbTnWZGauki6z9pMmw4f7bXK0JxrN9
	 6SU5kwEZafXjCGiDsaowZygSprL4kTLkm4kcktrPyioTpkqDRcbVWYZTjWdOy8tg0hhwz
	 P84yPRdbYljB2zphXP4a4R6lBLJnZoaJh4AnHADgJmPAb0TbXTiwTWuYpxDNR1TPRQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWgvp8C9;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6EB606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWgvp8C9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381d542bc29so4618523eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108893; x=1795713693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F65s4j3jEb+VZggG89B22KNP6t43t+7WO0QQgAmmc58=;
        b=JWgvp8C9ETJ0rXuwu+LdsTSKhpUsjm+gZpH9+knFNaC3XWYyTO3Yv0h0xL3eBqhdVC
         /cjHKpbaJGIax2dpqc/Dgng7Gzybp8H9yOIdyU+9R2tAlOFeB0la1ap+qABoCh9n3MKh
         lpE0jLZD5bnVeqGABPV4A61qNa0BV0ImnxcztiiVtSGez/OuSLb2q60aNk3RG8Lo84F6
         T5p2KyH+D1DQ/XCIi6bTmpZjcRueL+VCIm4qqb5e+oL+MSoE4DDbQrOmb/mWlADv5vW5
         ofQxaf0wRVzHQl3wzRkqfWlD4AEW8EOgvJl26BkyLvo6fboF6nwzPmzkPZm1jVQSLsyV
         kUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108893; x=1795713693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F65s4j3jEb+VZggG89B22KNP6t43t+7WO0QQgAmmc58=;
        b=mH4tKQO9vU19TJekEbE33WbleAAv57Y3fzDefhhIeRpNWOqYTAOGgYrwoU5qdjTUzT
         tbZtRldLyfPzlJYiy+ZTD1QVTm3wkcR4u6abZw6S6z/U1+FVWt6hJ74JnZnER7No6TOD
         kE1WtvGX/5KeGFAIABqbq6YrJaI9wdJ257up0X/SPjMhcsxw0DJGMlS1sIdefueyLZ5B
         z7X2ZHPR2DNuh1Sob9ghWLOR4LqJVtXROnbbFyV2avy2cJhRHYfYaM/dcxNkaqgEaEku
         l82dDjisATkOxC1fId49NQQ6XNZAzaMGEdGsEamCTtN6hGDLaX4UAvmx4M1sJ3Q5spTh
         ed4g==
X-Forwarded-Encrypted: i=1; AL+hErFXv796CeM7GhweU/L1to8MgpUdAErRcJgluXgn+UAnd0cjClmGyVLs0hLqr9WMrtTG8TnUxfRcKiURC8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0lYbKJ024Et7PdMSU2y6/Kw9u8hf90I+LiOFZWy0iDGkOV65U
	O6PC7s439HwAQfigWMJeUMHt2IijogV+hZnjoEe2IGNcTyu6ZJmuPcqQYU0SqfBD
X-Gm-Gg: AZFdTZfo8gbWJK23R2vtmaoyfW3ChiIsANhiKnsDWy/vSNifnPWw0ZTQkM+VQyJ7Vt3
	TKqmMhgS7gM9AYJLM6nlXo4fD528pPoQ5dVkOEYIboF7jgHxJD2GTI7lHRPdi+HNyXMW85Uslpe
	kT26KF8UkN09b3uALyGoTIu+kHRHPFScfRm9L1Oyy6kSq50wuH5EAHXP8QI/KzcDlA7ht+b8wYu
	455xwT0RnH6z227PrEtRIqVD8YERHySfo0lxNYEDBsfTCY7ElPCSPuijUe9rTTeqNd8TXRipCNn
	RJNpGu4jlp8IViQbOgQfc/K1wW+MG5y5qxPsVniL4IIVgraj1zCXX35WyhXDUJn8KWd8GYvWcCT
	AUJbXvzhJgrjEBm7RUks6hYP1B9x5XRq2368MZklluF6Pv3Z84FGns/S/ZkjmEFw69RPiGeQ714
	b6xKYsOIGbjd3JlwxXJSx3Vrq6Zonqkv2sCjtnimSMHCPDYUvLd9XNQ5DygmFEPR30sQ/zlvOyM
	jHv6Z54P++yJQ5FIw79zCG3jNrY0rzKBtC5G2w1ppR8e47u7AlzYFx6MlZao6uWWN2CyT77HgJM
	gtCo8mPmx53A9eRcTnAYBFSX
X-Received: by 2002:a05:693c:829b:10b0:376:feb:2df3 with SMTP id 5a478bee46e88-3856f85236cmr28905eec.20.1795108892707;
        Thu, 19 Nov 2026 09:21:32 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672cf745sm226887eec.18.2026.11.19.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:21:32 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org,
	dev@openvswitch.org
Cc: Aaron Conole <aconole@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v9 0/3] netlink: specs: fill in the missing ovs operations
Date: Thu, 19 Nov 2026 12:21:15 -0500
Message-ID: <20261119172118.3416958-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The ovs specs describe get and new but not every command the kernel
has registered: all three families lacked set, and ovs_flow also lacked
del. This series adds them, names the attributes each handler reads,
and corrects what the existing specs say about the kernel. No kernel
code changes.

v9:
https://lore.kernel.org/netdev/20261115072638.3163018-1-houminxi@gmail.com/
  - Rebased onto current net-next.
  - The note on the vport name is a complete sentence again. The v8
    wording stopped after "dp_ifindex from", so the sentence that says
    what the lookup falls back to was missing.
v8:
https://lore.kernel.org/netdev/20261110174751.973464-1@gmail.com/
  - The datapath spec no longer puts a maximum on masks-cache-size. The
    generator does not turn a check into a policy for these families, and
    the kernel bound is an expression, so the declaration promised
    something the spec cannot express.
  - The docs no longer say what a dump does with a key, a ufid or another
    request attribute. A dump now has its own request list for each family,
    which states what it takes, so the sentences that repeated it are gone.
    The ufid docs record the minimum length the policy sets, and the key,
    actions, stats, used and tcp-flags docs say the attributes appear in
    replies as well as in notifications.
  - The series gains a third patch for gaps that predate it. The vport
    netnsid is signed in the kernel. The two dumps stop sharing a request
    list with their get operation, and four lists named attributes their
    handler never reads or sends. The vport get request can be answered by
    port number, and the vport new doc says an ifindex needs an internal
    vport. The vport spec declared family version 2 where the kernel
    registers 1.
  - That patch also declares what the kernel registers: all four ovs specs
    document the header struct and none of them a member of it, the vport
    name note names the header member the lookup uses, the options note
    says what a set returns, the packet execute operation gains the
    validate flags and the admin permission, and the ynl selftest stops
    printing a field the datapath reply does not carry.
  - Deleting one flow sends that flow to the family's multicast group, a
    flush sends nothing, and the set operations do the same for the object
    they change, which those op docs now say.

v7:
https://lore.kernel.org/netdev/20261107120647.874906-1@gmail.com/
  - The ufid docs said a value outside 1-16 octets is read as absent, and
    that a dump ignores the attribute. Only a value longer than 16 octets
    is read as absent. A zero length value fails the policy check before
    the command runs, and the request fails with -ERANGE; a dump accepts
    the attribute and does not read it.
  - The del and key docs said that a del with an out of range ufid
    flushes the data path. That only holds when the request carries no
    key, which the text now says.
  - The get reply list names the last-used time and the TCP flags, which
    ovs_flow_cmd_fill_stats() fills for get and for dump, and the docs of
    the stats, the used time and the TCP flags now say replies and
    notifications rather than notifications only.
  - The vport set doc says what the command does instead of explaining
    why two attributes are missing from the list, and says that the type
    only has to match.
  - The datapath new doc reads as a sentence again, the masks cache size
    records its upper bound of 4096, and the vport new request list gains
    the port number, which its handler reads.
  - Patch 2 says why ifindex is s32, which is to match the policy and
    nla_get_s32_default() in the request path, and that the generated
    reply struct follows with a __s32 field while the reply itself keeps
    putting the value as u32.

v6:
https://lore.kernel.org/netdev/20261103183319.2730567-1-houminxi@gmail.com/
  - A del flushes the data path when it carries no key and no valid ufid,
    not when it carries neither. The kernel reads a ufid outside 1-16
    octets as absent, so such a request flushes as well. The ufid doc now
    says that, and that a new request with such a value indexes the flow
    by its key instead, and the attribute records the minimum length the
    policy enforces. The same sentences in
    include/uapi/linux/openvswitch.h follow.
  - ifindex is declared s32 with a minimum of 0, which is how both
    policies read it. No request used the attribute before this series,
    which is why the type went unnoticed.
  - The ops skip strict and dump validation in the kernel, so get, new,
    del and set say so in all three specs.
  - Rebased onto current net-next.

v5:
https://lore.kernel.org/netdev/20261025103409.3519874-1-houminxi@gmail.com/
  - ovs_flow dump gets a request list of its own with ufid-flags. It
    shared the get list, which offered a key and a ufid the kernel
    ignores on a dump. The reply is unchanged.
  - The key, actions and ufid docs no longer claim those attributes are
    always present, and say what the exceptions are: a ufid-identified
    flow sends no key or actions when the request asked for them to be
    left out, a dump leaves the actions out when they do not fit, and a
    dump ignores the ufid. The same sentences in
    include/uapi/linux/openvswitch.h are updated to match, since the
    spec text was copied from there.
  - The key doc now says a get and a set need a key or a ufid, that a
    new request needs a key, and that a del carrying neither flushes the
    data path.
  - The ovs_datapath new and set docs say per-cpu-pids takes effect only
    when the same request sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU in
    user-features.
  - The ovs_vport set doc says the vport is picked by name or by port
    number, names the rejections in the order the kernel checks them,
    and says upcall-pid is the only attribute that changes state.
  - Rebased onto current net-next after the merge window.

v4:
https://lore.kernel.org/netdev/20261015024132.698658-1-houminxi@gmail.com/
  - ovs_vport set lists port-no and ifindex. lookup_vport() finds a
    vport by name or by port number, and returns -EOPNOTSUPP as soon as
    it sees an ifindex, before the type or the options are looked at.
  - ovs_datapath new lists masks-cache-size, per-cpu-pids and ifindex.
    new calls ovs_dp_change(), which reads the first two, and reads
    ifindex itself.
  - ovs_flow get lists probe. ovs_flow_cmd_get() reads it to decide
    whether to log.
  - The key attribute doc now says a new request needs a key even when
    it finds an existing flow and replaces its actions, and that a dump
    reads neither the key nor the ufid. A del with neither flushes the
    data path, and the del operation doc says so too.

v3:
https://lore.kernel.org/netdev/20261012065552.2426415-1-houminxi@gmail.com/
  - no change since v2.

v2:
https://lore.kernel.org/netdev/20261006130533.1620706-1-houminxi@gmail.com/
  - ovs_flow new lists ufid-flags and probe, which ovs_flow_cmd_new()
    reads.
  - The commit message now says probe changes from binary to flag, and
    that new needs CAP_NET_ADMIN.
  - The key attribute doc no longer says a key is required for every
    request except a dump. get, set and del accept a ufid with no key,
    and only a new flow needs a key. A set that replaces the actions
    still needs a key.

Signed-off-by: Minxi Hou <houminxi@gmail.com>


Minxi Hou (3):
  netlink: specs: add ovs_flow del and set operations
  netlink: specs: add ovs datapath and vport set operations
  netlink: specs: correct the ovs specs where they do not match the
    kernel

 Documentation/netlink/specs/ovs_datapath.yaml |  53 +++++++--
 Documentation/netlink/specs/ovs_flow.yaml     | 110 ++++++++++++++----
 Documentation/netlink/specs/ovs_packet.yaml   |  20 +++-
 Documentation/netlink/specs/ovs_vport.yaml    |  55 +++++++--
 include/uapi/linux/openvswitch.h              |  51 +++++---
 tools/net/ynl/tests/ovs.c                     |   5 +-
 6 files changed, 227 insertions(+), 67 deletions(-)


base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
-- 
2.56.1

